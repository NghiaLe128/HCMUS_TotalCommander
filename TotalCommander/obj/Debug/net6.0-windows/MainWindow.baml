   M S B A M L   `   `   `  ����I  ETotalCommander, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:TotalCommanderTotalCommander  5   	       TotalCommander.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:TotalCommander     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)   .��5
      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   c� $��0��6   .@�5      �� �� 5      .��6   Back6   �� 5      .��6   	Forward6   �� 5      .��6   Up6   �� 5      �� 5      .��6   Copy6   �� 5      .��6   Move6   �� 5      .��6   Delete6   �� 5      5      ]� 5   
   $��2��6   $
��True��6!   .+�5      �� $
��Left=�6   $	��Top=�64   $��5q�6I   .+�5!      ��  �� Orientation$ 
Horizontal=�6   .+�5"      �� -   5         ��Name$ driveComboBox��5"      $��20��66   $	��100��6B   .@�5#      �� .��6'   Select Drive65   5$      �� 5&      -   5         ��Name$ currentDirectoryLabel��5&      $��Current Directory: ��6;   $��5q�6Y   5'      5(      � 5*      $��1��6   $��0��5+      $��2��5,      .+�5-      �� -   5         ��Name$ fileListView��5-       �� View 5.      �� 5/      -   5        	gridView1��.P�50      �� $
��Name��6W    �� DisplayMemberBinding 6-   �� *
FileName+ �� Width 6e   �� 	 �� ElementName$
	 name��
 �� Path$
 ActualWidth��� 51      $
��Type��6W    6-   �� *
FileType+ 6e   �� $
	 type��$
 ActualWidth��� 52      $
��Size��6W    6-   �� *
FileSize+ 6e   �� $
	 size��$
 ActualWidth��� 53      $
��Date��6W    6-   �� *
FileDate+ 6e   �� $	 created��$
 ActualWidth�54      ��56      �� 57       �� 
TargetType" ��6    .�58      -   5        59      5;      � 5<      $y�Hidden=�6    � ColumnDefinitions 5=      �� 5@      $��2* �6+   �� 5B      $��* �6+   �� 5D      $��* �6+   �� 5E      $��* �6+   .+�5K      � -   5         �Name$
 name��5K   +   $��0��6   6+   � 5L      -   5        $
 type��5L   +   $��1��6   6+   � 5M      -   5        $
 size��5M   +   $��2��6   6+   � 5N      -	   5        $ created��5N   +   $��3��6   6+   5O      5P      5Q      5R      5S      