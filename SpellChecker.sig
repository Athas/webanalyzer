signature SpellChecker =
sig

    (* Thrown when asked to check the spelling for an unknown
    language. The string is the language code that was not known. *)
    exception dictionaryNotFound of string;

    (* Given a language code and a word, return a boolean indicating
    whether the word is spelled properly according to the language. *)
    val spellCheckWord : string -> string -> bool;

    (* Given a language code and a list of words, return a list
    mapping words to boolean values indicating whether they are
    properly spelled. The result list will have the same sequence of
    words as the input list. The result is equivalent to:
    map (fn w => (w, spellCheckWord language w)) words
    , but may be faster. *)
    val spellCheckWords : string -> string list -> (string * bool) list;

    (* Return true if we are able to spell-check for the given language code. *)
    val hasDictionary : string -> bool;

end
