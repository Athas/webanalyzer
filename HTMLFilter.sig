signature HTMLFilter =
sig

    (* A filter defining what should be removed and what shouldn't be
       removed from a html-parsetree.
       
       'And' and 'Or' should be declared infix. *)
    datatype Filter = ByTagName of string
                    | ByAttribute of (string * string)
                    | And of Filter * Filter
                    | Or of Filter * Filter
                    | Not of Filter
                    | None;
             
    (* removes unwanted content from a HTML parsetree *)
    val filterhtml : HTMLParser.parsetree list
                     -> HTMLParser.parsetree list;
end
