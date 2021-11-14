///Processes the emotion input

var res = async_load[?"result"];
var status = async_load[?"status"];
if(status == 0){
	//no error
	var _parse=json_parse(res);
	if is_struct(_parse.data) emotion=_parse.data.emotion;
}