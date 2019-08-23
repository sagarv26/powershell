Add-Type -AssemblyName System.speech
$tts = New-Object System.Speech.Synthesis.SpeechSynthesizer

$Phrase2 = "What are you doing, $env:USERNAME"

$tts.Rate= 0  
$tts.Speak($Phrase2)
