///Processes the emotion input

var res = async_load[?"result"];
var status = async_load[?"status"];
if(status == 0){
	//no error
	emotion = json_parse(res).data.emotion;
	show_debug_message(emotion);
}