
" Yellow:       Keyword
" Red:          Delimiter
" Orange:       Type
" Reddish:      PreProc
" Blue:         Function
" Green:        String
" Bold-lila:    Todo
" Pink:         Underlined


" General
" syn match       speech          "Speech"
" hi def link     speech          Function
" syn match       except	    	"Exception\c"
" hi def link     except          Delimiter
" syn match       error	    	"error\c"
" hi def link     error           Delimiter
" syn match       cpuLoad         "CPU1.\{-}|"
" hi def link     cpuLoad         String
" syn match       onScreenLogger  "logToScreen(.*)"
" hi def link     onScreenLogger  PreProc



" Speech
" syn match       odpBackend          "Speech\.DM"
" hi def link     odpBackend          Underlined
syn match       nbestResultText     "recognizedString=\".\{-}\""
hi def link     nbestResultText     Todo
syn match       nbestResultConf     "confidence=\d*"
hi def link     nbestResultConf     Todo
syn match       nbestResultWord     "NBestList"
hi def link     nbestResultWord     Function
syn region      nbestResult         start="SpeechRecognitionDSIListenerFacade#updateNBestList" end="$" contains=nbestResultText,nbestResultWord,nbestResultConf



" ODP
" syn match       odpPerformance     "(took\ \d*\ ms)"
" hi def link     odpPerformance     Type
" syn match       odpInternal    "Speech\.DM\.Core"
" hi def link     odpInternal    Keyword
" syn match       odpInOutputStart    "\w*PUT" contained
" hi def link     odpInOutputStart    Keyword
" syn match       odpText             "\".\{-}\"" contained
" hi def link     odpText             Keyword
" syn region      odpInOutput         start="\*\*\*\*\*\s\w*PUT:" end="$" contains=odpText,odpInOutputStart
" syn match       utterance     "\*\*\*\*\*\ OUTPUT:\ Speech"
" syn match       utterance     "\*\*\*\ UTTERANCE\ (USER)"


"Sued-seite
" syn match       buttonPush      "SpeechKeyboardComponent#keyReleased:"
" hi def link     buttonPush      Todo
" syn match       speechSouth     "MIB\.SPEECH"
" hi def link     speechSouth     Todo
" syn match       beep            "playRecognizerReadyTone"
" hi def link     beep            Todo
" syn match       nbest           "nbest:.*$"
" hi def link     nbest           Todo


" syn match       slmGramType     "grammarType=\zs'.\{-}'" contained
" hi def link     slmGramType     Todo
" syn match       slmOrtho        "ortho=\zs\'.\{-}'" contained
" hi def link     slmOrtho        Type
" syn match       slmConf         "conf=\zs\d*" contained
" hi def link     slmConf         Todo
" syn match       slmTopic        "semTopicName=\zs'.\{-}'" contained
" hi def link     slmTopic        Todo
" syn match       slmScore        "semTopicScore=\zs\d*" contained
" hi def link     slmScore        Todo
" syn region      slmResult       start="ext\.\ nbest:\ {" end="$" contains=slmOrtho,slmConf,slmScore,slmTopic,slmGramType



" mxx trace
" syn match       odpThread     "\s\w\{-}-\d*-thread-\d*"
" hi def link     odpThread     Type
" syn match       mxxCpuLoadLow     "CPU=\d%"
" syn match       mxxCpuLoadLow     "CPU=[0-6]\d%"
" hi def link     mxxCpuLoadLow     String
" syn match       mxxCpuLoadMedium     "CPU=[7-8]\d%"
" hi def link     mxxCpuLoadMedium     Keyword
" syn match       mxxCpuLoadHigh     "CPU=9\d%"
" syn match       mxxCpuLoadHigh     "CPU=100%"
" hi def link     mxxCpuLoadHigh     Delimiter
" syn match       mxxPtt     "keyPTTPressed"
" hi def link     mxxPtt     Todo
" syn match       mxxJavaProcess     "ifs/jre/bin/java"
" hi def link     mxxJavaProcess     Underlined

" speech/EBSpeechApp
" ./bin/apps/esosearch      "truffles



" syn region      exceptTrace		start=+^#####\s\{-}Start+ end=+^#####\s\{-}End.*+
" hi def link     exceptTrace     Delimiter

" syn match       tts     "\*\*\*\*\*\ INPUT:"
" syn match       tts     "\*\*\*\ UTTERANCE\ (SYSTEM)"
" hi def link     tts       Keyword
