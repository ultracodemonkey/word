#!/lang/b
use b

cstr cgi_path
cgi_path_init()
	cgi_path = env("PATH_INFO", "")
	if cgi_path[0] == '/'
		++cgi_path

boolean cstr_empty(cstr s)
	return *s == '\0'

Main()
	cgi_html()
	cgi_env()
	cgi_path_init()

	if strchr(cgi_path, ',') != NULL
		frameset()
	 else
	 	content()

frameset()
	tag("html")
	tag("head")
	tag("title")
	Sayf("%s - quiki", cgi_path)
	tag("/title")
	tag("/head")
	tag("frameset", "cols", "*,*,*")
	tag("frame", "name", "1", "src", cgi_path, "scrolling", "yes")
	tag("frame", "name", "2", "src", cgi_path, "scrolling", "yes")
	tag("frame", "name", "3", "src", cgi_path, "scrolling", "yes")
	tag("/frameset")
	tag("/html")

content()
	frameset()



# XXX work on a buffer?
