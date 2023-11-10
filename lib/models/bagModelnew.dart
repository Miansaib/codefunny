import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Bagmodelnew {
  final int id;

  final String name;
  final String code;
  Bagmodelnew({
    required this.id,
    required this.name,
    required this.code,
  });
}

List<Bagmodelnew> baglist = [
  Bagmodelnew(id: 1, name: "Java", code: """

  #  C# Code
  ---
  This is a simple Markdown test. Provide a text string with Markdown tags
  to the Markdown widget and it will display the formatted output in a
  scrollable widget.
  
  ## Section 1
  Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
  aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
  eget est condimentum, vitae porttitor diam ~~ornare~~. [eclectify](www.eclectify.com)
  
  ![](resource:assets/flutter_logo.png)
  
  ### Subsection A
  *Sed et massa finibus*, blandit massa vel, vulputate velit. Vestibulum vitae
  venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend
  accumsan ante.__** 
  > class HelloWorld 
  >  {
  >  public static void main(String[] args) {
  >      System.out.println("Hello, World!"); 
  >  }
  >  }


>  String name =txtname.getText();
>  String age =txtmobile.getText();
>  String course =txtcourse.getText();
>        try {
>            Class.forName("com.mysql.jdbc.Driver"); //Register the mysql driver
>            con1 = DriverManager.getConnection("jdbc:mysql://localhost/linda","root","");
>            insert = con1.prepareStatement("insert into record (name,mobile,course)values(?,?,?)");
>            insert.setString(1,name);
>            insert.setString(2,age);
>            insert.setString(3,course);
>            insert.executeUpdate();
>           JOptionPane.showMessageDialog(this, "Record Saved");                        
>            txtname.setText("");
>            txtmobile.setText("");
>            txtcourse.setText("");
>            table_update();
>        } catch (ClassNotFoundException ex) {
>            Logger.getLogger(crud.class.getName()).log(Level.SEVERE, null, ex);
>        } catch (SQLException ex) {
>            Logger.getLogger(crud.class.getName()).log(Level.SEVERE, null, ex);
>        } 




    Mauris interdum turpis eget est condimentum, vitae porttitor diam ornare.
  
  ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png)
  
  1. ajdsks
     1. this requires 3 spaces
     2. fdlefkl
  2. reorek
  3. fdpopore


    Mauris interdum turpis eget est condimentum, vitae porttitor diam ornare.
  
  ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png)
  
  1. ajdsks
     1. this requires 3 spaces
     2. fdlefkl
  2. reorek
  3. fdpopore

    Mauris interdum turpis eget est condimentum, vitae porttitor diam ornare.
  
  ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png)
  
  1. ajdsks
     1. this requires 3 spaces
     2. fdlefkl
  2. reorek
  3. fdpopore

  
  Mauris interdum turpis eget est condimentum, vitae porttitor diam ornare.
  
  ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png)
  
  1. ajdsks
     1. this requires 3 spaces
     2. fdlefkl
  2. reorek
  3. fdpopore
 """),
  Bagmodelnew(id: 2, name: "C#", code: "saaaaaa"),
  Bagmodelnew(id: 3, name: "VB", code: "vvvvvvvvvvv"),
  Bagmodelnew(id: 4, name: "C", code: "qqqqqqqqqqqqqqqqqq"),
  Bagmodelnew(id: 5, name: "Asp", code: "uiiiiiiiiiiiiiiii")
];
