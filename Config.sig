signature Config =
sig
    (* Return the HTTP user agent ID used by the application. *)
    val setHttpUserAgent: string -> unit;
    val httpUserAgent : unit -> string;
    val setCrawlDepthLimit : int -> unit;
    val crawlDepthLimit : unit -> int;
    val setCrawlDelay: int -> unit;
    val crawlDelay: unit -> int;
    val setLix: unit -> unit;
    val lix: unit -> bool;
    val setFkrt: unit -> unit;
    val fkrt: unit -> bool;
    val setFre: unit -> unit;
    val fre: unit -> bool;
    val setSpell: unit -> unit;
    val spell: unit -> bool;

    val setDefaults: unit -> unit;
end
