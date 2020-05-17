
function checkAge(strDate) {
	var typed = typeof strDate;
	
	
    var today = new Date();
    var d = strDate;
 
    
    d = d.split("/");
	
    var byr = parseInt(d[0]);
    var nowyear = today.getFullYear();
    if (byr > nowyear || byr < 1900) {  // check valid year
        showMessage();
        return false;
    }
    var bmth = parseInt(d[1], 10) - 1;   // radix 10!
    if (bmth < 0 || bmth > 11) {  // check valid month 0-11
        showMessage()
        return false;
    }
    var bdy = parseInt(d[2], 10);   // radix 10!
    var dim = daysInMonth(bmth + 1, byr);
    if (bdy < 1 || bdy > dim) {  // check valid date according to month
        showMessage();
        return false;
    }
    
    var age = nowyear - byr;
    var nowmonth = today.getMonth();
    var nowday = today.getDate();
    var age_month = nowmonth - bmth;

	//alert("age yrs: "+age+" months: "+age_month);
    if(age == 0)
    {  
	if (bmth == nowmonth && nowday > bdy)
	 { age=1 }
	else
	{  return false;}
	                           }			
    if (bmth > nowmonth) { age = age - 1 }  // next birthday not yet reached
    else if (bmth == nowmonth && nowday < bdy) { age = age - 1 }
    
    return age;
    
}

function showMessage()
{
    
}

function daysInMonth(month, year) {  // months are 1-12
    var dd = new Date(year, month, 0);
    return dd.getDate();
}
