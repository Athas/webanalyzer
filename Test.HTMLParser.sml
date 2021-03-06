(* Test of HTMLLexer *)
local

fun getTag (parseTree) = case parseTree of
                             HTMLParser.Tag (tag, children) => SOME (tag, children)
                           | _ => NONE
fun getText (parseTree) = case parseTree of 
                            HTMLParser.Text t => SOME t
                           | _ => NONE
fun getHeadText (parsetree) = HTMLParser.textContents (valOf (getText (hd (#2 (valOf (getTag parsetree))))))

val parseTree = HTMLParser.parse   ( "<html>"
                                     ^   "<head>"
                                     ^     "<title>Foo</title>"
                                     ^   "</head>"
                                     ^   "<body>"
                                     ^     "<a href=\"baz.html\">BAR</a>"
                                     ^     "<br>"
                                     ^     "Bar1"
                                     ^     "<p>"
                                     ^       "foo"
                                     ^     "<p>"
                                     ^       "bar"
                                     ^     "<p>"
                                     ^       "baz"
                                     ^   "</body>"
                                     ^ "</html>" );

val (html, htmlRest) = valOf (getTag (List.hd parseTree));
val (head, headRest) = valOf (getTag (List.hd htmlRest));
val (title, titleRest) = valOf (getTag (List.hd headRest));
val titleData = valOf (getText (List.hd titleRest));
val (body, bodyRest) = valOf (getTag (List.hd (List.tl htmlRest)));
val (a, aRest) = valOf (getTag (List.hd bodyRest));
val (br, _) = valOf (getTag (List.nth(bodyRest, 1)));
val txt = valOf (getText (List.nth(bodyRest, 2)));
val aData = valOf (getText (List.hd aRest));
val [p1, p2, p3] = (tl o tl o tl) bodyRest;

in

(* Test that the parser parses the correct tags *)
val testHTMLParser001 = HTMLParser.tagName html = "html";
val testHTMLParser002 = HTMLParser.tagName head = "head";
val testHTMLParser003 = HTMLParser.tagName title = "title";
val testHTMLParser004 = HTMLParser.textContents titleData = "Foo";
val testHTMLParser005 = HTMLParser.tagName body = "body";
val testHTMLParser006 = HTMLParser.tagName a = "a";
val testHTMLParser007 = HTMLParser.textContents aData = "BAR";
val testHTMLParser008 = HTMLParser.tagName br = "br";
val testHTMLParser009 = HTMLParser.textContents txt = "Bar1";

(* Test that we pull out the correct attributes from tags.*)
val testHTMLParserAttributes001 = HTMLParser.getAttribute "href" a = SOME "baz.html";

(* Test that nasty implicitly closed block-tags work. Only tests P for now. *)
val testBlockTag001 = getHeadText p1 = "foo";
val testBlockTag002 = getHeadText p2 = "bar"; 
val testBlockTag003 = getHeadText p3 = "baz";

end;
