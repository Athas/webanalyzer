load "Regex";
load "Socket";
load "Unix";
load "Binarymap";
load "Msp";
load "Listsort";

app use ["Util.sig", "Util.sml",
         "Config.sig", "Config.sml",
         "Http.sig", "Http.sml",
         "HTMLLexer.sig", "HTMLLexer.sml",
         "HTMLParser.sig", "HTMLParser.sml",
         "HTMLFilter.sig", "HTMLFilter.sml",
         "TextExtractor.sig", "TextExtractor.sml",
         "Sentencifier.sig", "Sentencifier.sml",
         "TextAnalyser.sig", "TextAnalyser.sml",
         "TextAnalysisReporter.sig", "TextAnalysisReporter.sml",
         "Robots.sig", "Robots.sml"];
