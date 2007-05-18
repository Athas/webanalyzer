signature Http =
sig 
    eqtype URI
    exception badURI
    val buildURI : URI option * string -> URI

    (* Streng-repr�sentation af uri. Det vil g�lde for alle uri, at: 
         buildURI(NONE, stringFromURI uri) = uri *)
    val stringFromURI : URI -> string

    val protocolFromURI : URI -> string 
    val serverFromURI : URI -> string
    val pathFromURI : URI -> string

    (* Skanner html-side for uri. Det kan ikke garanteres,
       at alle returnerede uri'er er gyldige. *)
    val occurrences: string -> string list

   (* Failure kan indeholde tre forskellige 
      fejlmeddelelser. HTTP har en status-kode 
      defineret i http-protokollen og dern�st en
      forklarende tekstbesked. Socket bruges, hvis 
      et problem er opst�et med netv�rkskommunikationen. 
      Endelig vil alle andre fejlmeldinger v�re 
      d�kket af General. *)
    datatype Failure = HTTP of int * string
                     | Socket of string
                     | General of string
    exception Error of Failure

   (* Henter html-fil, som URI refererer til. En Error-undtagelse
      rejses ved alle slags problemer. *)
    val getURI : URI -> string
end;