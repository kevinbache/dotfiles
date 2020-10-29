"""Create symlinks from appropriate files in home dir to dotfiles/shared/home and also dotfiles/osx/home if on mac.
"""
import subprocess
from pathlib import Path
import platform
import shutil


def gather_repo_files(local_files_dir):
    files_to_link_absolute = [f for f in local_files_dir.rglob('*') if not f.is_dir()]
    files_to_link_relative = [f.relative_to(local_files_dir) for f in files_to_link_absolute]
    return files_to_link_absolute, files_to_link_relative


def link_files(repo_files_absolute, repo_files_relative, homedir_dir, verbose=True):
    def vprint(message=""):
        if verbose:
            print(message)

    homedir_files = [homedir_dir.joinpath(f) for f in repo_files_relative]

    # Create homedir directories
    vprint("")
    vprint("Checking if any directories need to be created...")
    homedir_dirs = set([f.parent for f in homedir_files])
    for d in homedir_dirs:
        if d.is_symlink():
            raise ValueError("  Homedir directory, {}, is a symlink.  Unsure how to proceed.".format(d))
        elif not d.exists():
            vprint("  Creating directory {}".format(d))
            Path.mkdir(d, parents=True)

    # Figure out backup directory
    backup_dir = None
    if any([f.exists() for f in homedir_files]):
        # make backup dir
        backup_dir_name = '.dotfiles_backup'
        backup_dir = homedir_dir / backup_dir_name
        backup_counter = 1
        while backup_dir.exists():
            backup_dir = homedir_dir / '{}_{}'.format(backup_dir_name, backup_counter)
            backup_counter += 1

    vprint("")
    vprint("Linking Files:")
    for repo_file_absolute, repo_file_relative, homedir_file in \
            zip(repo_files_absolute, repo_files_relative, homedir_files):

        # deal with existing files in homedir
        if homedir_file.is_symlink():
            # blow away symlinks
            homedir_file.unlink()
        elif homedir_file.exists():
            # but backup files
            this_backup_dir = backup_dir.joinpath(repo_file_relative.parent)
            if not this_backup_dir.exists():
                this_backup_dir.mkdir(parents=True, exist_ok=True)
            vprint("  Backing up {:40} to {:40}".format(str(homedir_file), str(this_backup_dir)))
            shutil.move(str(homedir_file), str(this_backup_dir))

        vprint("  Symlinking {:80} to {:80}".format(str(homedir_file), str(repo_file_absolute)))

        homedir_file.symlink_to(repo_file_absolute)
        # make sure the symlink has matching ownership stats to original file
        repo_owner, repo_group = repo_file_absolute.owner(), repo_file_absolute.group()
        repo_chmod = repo_file_absolute.stat().st_mode
        homedir_file.chmod(repo_chmod)
        shutil.chown(repo_file_absolute, user=repo_owner, group=repo_group)

    vprint("")


if __name__ == '__main__':
    this_dir = Path(__file__).parent.resolve()
    homedir_dir = Path.home()

    repo_files_absolute, repo_files_relative = gather_repo_files(this_dir / 'shared' / 'home')

    if platform.system() == 'Darwin':
        absolute_extra, relative_extra = gather_repo_files(this_dir / 'osx' / 'home')
        repo_files_absolute += absolute_extra
        repo_files_relative += relative_extra

        # TODO: deal with non home files
        # absolute_extra, relative_extra = gather_repo_files(this_dir / 'osx' / 'Library')
        # repo_files_absolute += absolute_extra
        # repo_files_relative += relative_extra

    if 'linux' in platform.system().lower():
        absolute_extra, relative_extra = gather_repo_files(this_dir / 'linux' / 'home')
        repo_files_absolute += absolute_extra
        repo_files_relative += relative_extra

    link_files(repo_files_absolute, repo_files_relative, homedir_dir)
    subprocess.call("vim +'PlugInstall' +qa \n", shell=True)

    # NOTE: this needs to be run with sudo to change permissions of plist files.
