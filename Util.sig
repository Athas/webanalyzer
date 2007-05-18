signature Util =
sig type 'a sock = ('a, Socket.active Socket.stream) Socket.sock

    val readChar: 'a sock -> char
    val readLine: 'a sock -> string
    val readEmptyLine: 'a sock -> string

    (* Overs�tter symbolsk navn p� v�rt til ip-adresse *)
    val gethostbyname: string -> string

    val assoc: ''a -> (''a * 'b) list -> 'b option

    val readFrom: string -> string
    val getFirstIndexOf: char * string -> int
    val trimStr: string -> string

    exception IOError of string
                                 
end;
