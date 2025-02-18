// alert_boxed_message color options
#define DEFAULT "default"
#define BLUE "blue"
#define GREEN "green"
#define GREY "grey"
#define ORANGE "orange"
#define PINK "pink"
#define PURPLE "purple"
#define RED "red"
#define YELLOW "yellow"
#define alert_boxed_message(color, str) ("<div class='chat_alert_[color ? "[color]" : "default"]'>" + str + "</div>")

// chat spans
#define span_debugyellow(str) ("<span class='debugyellow'>" + str + "</span>")
#define span_debugcyan(str) ("<span class='debugcyan'>" + str + "</span>")
#define span_debugwhite(str) ("<span class='debugwhite'>" + str + "</span>")
#define span_debugpink(str) ("<span class='debugpink'>" + str + "</span>")
#define span_rlooc(str) ("<span class='rlooc'>" + str + "</span>")
