package web;
public class dateFormateChnge {

    public static String dateFormateChnge(String date) {
//        convert dd/MM/yyyy to yyyy/MM/dd
System.out.println("lenth >>"+date.length());
        if(date.length()==0){return "";}
        if(date!=null && date!=""){
        String datee[]=date.split("/");
        return datee[2]+"-"+datee[1]+"-"+datee[0];
        }
        return "";
    }
    
}
