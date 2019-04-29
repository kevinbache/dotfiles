from pathlib import Path
import shutil

verbose = True
def vprint(message=""):
    if verbose:
        print(message)

def print_list(l):
    for e in l:
        print('  {}'.format(e))


this_dir = Path(__file__).parent.resolve()
local_files_dir = this_dir / 'files'
target_dir = Path.home()

files_to_link_absolute = [f for f in local_files_dir.rglob('*') if not f.is_dir()]
files_to_link_relative = [f.relative_to(local_files_dir) for f in files_to_link_absolute]
target_files = [target_dir.joinpath(f) for f in files_to_link_relative]

print()
print("Files to Link:")
print_list(files_to_link_absolute)
print()
print("Target files:")
print_list(target_files)

# Create target directories
target_dirs = set([f.parent for f in target_files])
for d in target_dirs:
    if d.is_symlink():
        raise ValueError("Target directory, {}, is a symlink.  Unsure how to proceed.".format(d))
    elif not d.exists():
        vprint("Creating target directory {}".format(d))
        Path.mkdir(d)

# Create backup directory
backup_dir = None
if any([f.exists() for f in target_files]):
    # make backup dir
    backup_dir_name = '.dotfiles_backup'
    backup_dir = target_dir / backup_dir_name
    backup_counter = 1
    while backup_dir.exists():
        backup_dir = target_dir / '{}_{}'.format(backup_dir_name, backup_counter)
        backup_counter += 1
    vprint()
    vprint("Making backup dir: {}".format(backup_dir))
    Path.mkdir(backup_dir, parents=True, exist_ok=True)

    for relative_file in files_to_link_relative:
        this_backup_dir = backup_dir.joinpath(relative_file.parent)
        if not this_backup_dir.exists():
            vprint("  Making backup subdir: {}".format(this_backup_dir))
            this_backup_dir.mkdir(parents=True, exist_ok=True)

for local_file, relative_file, target_file in zip(files_to_link_absolute, files_to_link_relative, target_files):
    vprint()
    vprint("Starting file {}".format(local_file))

    if not local_file.is_dir():
        this_target_dir = target_file.parent

    if target_file.exists() or target_file.is_symlink():
        this_backup_dir = backup_dir.joinpath(relative_file.parent)
        vprint("Backing up {:40} to {:40}".format(str(target_file), str(this_backup_dir)))
        shutil.move(str(target_file), str(this_backup_dir))
    else:
        vprint("Target_file, {:40}, does not exist".format(str(target_file)))
    vprint("Symlinking {:40} to {:40}".format(str(target_file), str(local_file)))
    target_file.symlink_to(local_file)
