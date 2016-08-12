
" loads the searches and colors as global variables
ruby << EOR

    @yellow = "Keyword"
    @red = "Delimiter"
    @orange = "Type"
    @reddish = "PreProc"
    @blue = "Function"
    @green = "String"
    @lila = "Todo"       # also bold
    @pink = "Underlined"

    ## CAREFULL with regexes. Ruby regexes are replaced with vim regexes
    #   (?i)  >   \c
    #   *?    >   \{-}
    @searches = [

        # SEARCH            MATCH REGEX                            COLOR FOR HIGHLIGHTING

        #Basic highlghting
        [ 0             ,  '(?i)speech'                            ,  @blue],
        [ 0             ,  'hmi\.App\.Speech'                      ,  @blue],
        [ 0             ,  'hmi\.App\.Speech\.DM'                  ,  @pink],
        [ 0             ,  'hmi\.App\.Speech\.DM\.Core'            ,  @yellow],

        #general erros
        [ 0             ,  '(?i)error'                             ,  @red],
        [ 0             ,  '(?i)exception'                         ,  @red],
        [ 1             ,  'Start of Bundle.*?failed'               ,  @lila],

        # General info
        [ 1             ,  '========== Marker'                     ,  @lila],      # Eso-Trace Marker
        [ 1             ,  '--\s+--\s+\[\d+\]'                     ,  @lila],      # Blue-Pirate Marker
        [ 1             ,  'UI #\d*'                               ,  @lila],
        [ 1             ,  'SpeechKeyboardComponent#keyReleased:'  ,  @lila],
        [ 1             ,  'keyPTTPressed'                         ,  @lila],      # MMX ptt

        # Suedsite logs
        [ 0             ,  'MIB\.SPEECH'                           ,  @lila],
        [ 0             ,  'grammarType=\'.\{-}\''                 ,  @lila],
        [ 0             ,  'ortho=\'.\{-}\''                       ,  @orange],
        [ 0             ,  'semTopicScore=\d*'                     ,  @lila],

        [ 0             ,  'semTopicName=\'.*?\''                ,  @lila],
        [ 0             ,  'semTopicScore=\'.*?\''               ,  @lila],
        [ 1             ,  'playRecognizerReadyTone.*?DSITTS'       ,  @lila],
        [ 1             ,  'logToScreen(.*?)'                       ,  @red],
        [ 1             ,  'responseExecuteRecognition'            ,  @yellow],

        # Performance
        #[ 1             ,  'CPU='                                  ,  nil],
        [ 0             ,  'CPU=\d%'                               ,  @green],
        [ 0             ,  'CPU=[1-6]\d%'                          ,  @green],
        [ 0             ,  'CPU=[7-8]\d%'                          ,  @orange],
        [ 0             ,  'CPU=9\d%'                              ,  @red],
        [ 0             ,  'CPU=10\d%'                             ,  @red],
        [ 0             ,  'ifs/jre/bin/java'                      ,  @pink],
        [ 1             ,  '\s\w*?-\d*-thread-\d*'                 ,  @orange],

        # Recognition
        [ 1             ,  '\d+\s+nbest:\s\S+'                     ,  @lila],      # BNF results
        [ 1             ,  'ext\.\ nbest:\ {.*?conf=[4-9][7-9]\d\d'    ,  nil],
        [ 1             ,  'ext\.\ nbest:\ {.*?conf=\d\d\d\d\d+'    ,  nil],
        [ 1             ,  'Activating grammars'                   ,  nil],
        [ 1             ,  'GrammarManager.*?grammars:'             ,  nil],
        [ 1             ,  '\*\*\*\*\*\s\w*PUT:'                   ,  @yellow],
        [ 1             ,  '\*\*\*\ UTTERANCE'                     ,  @yellow],

        # Detailed Recognition
        [ 1  ,  'SpeechRecognitionDSIListenerFacade#updateNBestList'            ,  nil],
        [ 1  ,  'ODPRecognitionCallbackFacade#recognitionFinished: replyCode='  ,  nil],
        [ 1  ,  'SpeechRecognitionStatusInfoBroker#updateReconizerStatus'       ,  nil],
        [ 1  ,  'DSISpeechRecServer::startRecognition'                          ,  nil],

        # Startup
        #[ 1  ,  'SpeechActivator#start'               ,  @yellow],
        #[ 1  ,  'SpeechActivatorODP#start'            ,  nil],
        #[ 1  ,  'Bundle Speech\w* Startup completed'  ,  @yellow],
        #[ 1  ,  'PLATFORM:BundleLoader'               ,  @yellow],
        #[ 1  ,  '#Starting ODP\.\.\.'                 ,  @yellow],
        #[ 1  ,  'Platform#onLoadingCompleted()'       ,  @yellow],


        # Trace analysis: PTT
        # line =~ /SpeechAudioComponent#requestAudioConnections/ ||                                      #  HmiRequestAudioConnections
        # line =~ /SpeechAudioInfoBroker#updateAudioStatus.*CONNECTION_STARTED.*CONNECTION_FADED_IN/ ||  #  HmiResponseAudioConnections
        # line =~ /RESPONSE: beforeDialogStarted() = StatusSuccess/ ||                                   #  OdpInDialogActive
        # line =~ /'de.semvox.SQUINT' handles event: RecognitionStarted/ ||                              #  OdpStartingRecognition
        # line =~ /SpeechRecognitionDSIAccess#startRecognition/ ||                                       #  DsiStartingRecognition
        # line =~ /SpeechTTSServiceListener#speakingFinished/ ||                                         #  DsiTtsFinished
        # line =~ /ODPGenerationCallbackFacade#synthesisFinished()/ ||                                   #  OdpInTtsFinished

        # BluePirate-MMX
        # line =~ /CPU=/ ||
        # line =~ /keyPTTPressed/ ||
        # line =~ /\s\w*-\d*-thread-\d*/ ||
        # line =~ /speech\/EBSpeechApp/ ||
        # line =~ /\.\/bin\/apps\/esosearch/ ||



    ]
EOR

function! LogHighlight()
ruby << EOR

    def convertRubyRegexToVim(pattern)
        pattern = pattern.gsub(/\*\?/, '\{-}')
        pattern = pattern.gsub(/\(\?i\)/, '\c')
        return pattern
    end

    def highlight(name, match, color)
        Vim.command('syn match ' + name + ' "' + convertRubyRegexToVim(match) + '"')
        Vim.command('hi def link ' + name + ' ' + color)
    end

    @searches.each_with_index{ |currentSearch,i|
        search =  currentSearch[1]
        color =  currentSearch[2]
        if color != nil
            highlight("highlightGroup" + i.to_s, search, color)
        end
    }
EOR
endfunction


function! LogSearch()
ruby << EOR
    @debug = false

    @currBuffer = Vim::Buffer.current
    @bufferName = @currBuffer.name

    @quickfixLines = []
    def addLine(lineNumber, line)
        @quickfixLines << @bufferName + ':' + lineNumber.to_s + ':' + line
    end

    def linesToQuickfix()
        c = 'cexpr! ' + @quickfixLines.to_s
        if @debug; puts c end

        Vim.command(c)
    end


    def getRegexesForSearches()
        regexSearches = []
        for currentSearch in @searches
            if currentSearch[0] == 1
                regexSearches << Regexp::new(currentSearch[1])
            end
        end
        return regexSearches
    end


    puts "Searching file..."

    searchStart = Time.now
    regexSearches = getRegexesForSearches()

    for i in 1..@currBuffer.count
        line = @currBuffer[i]
        for currentRegex in regexSearches
            if line =~ currentRegex
                addLine(i, line)
                break
            end
        end
    end

    searchDone = Time.now
    puts "Searching took #{searchDone-searchStart}sec"

    linesToQuickfix()

EOR
endfunction
