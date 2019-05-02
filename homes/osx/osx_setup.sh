#!/usr/bin/env bash

# disable dictation
defaults write com.apple.SpeechRecognitionCore AllowAudioDucking -bool NO
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMAllowAudioDucking -bool NO
