   M S B A M L   `   `   `  ����A  =WpfApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:WpfAppWpfApp  5   	       WpfApp.MainWindow   5   	   W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   &localclr-namespace:WpfApp     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��815��6)   .��5	      �  � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   � $��0��6   $��5,5,5,5q�6!    � Orientation$ 
Horizontal=�62   .+�5      �� 
Max Url:6"   �� 5      -   5         ��Name$ 	MaxResult��5      6-   5      � 5   
   $��1��6   $	��350��6   $��0,5,0,5q�6)    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   .+�5      � $��0��6   $��5,5,5,5q�6(   $ Vertical=�69   .+�5      �� -   5         ��Name$ Result��5      $��30��6)   $��70��65   $��Result��6@   6Q   �� 5      -   5        $ Start��5      $��30��6(   $��70��64   $��Start��6?   6O   �� 5      -   5        $
 Stop��5      $��30��6'   $��70��63   $
��Stop��6>   6M   5      � 5      $��1��6   .+�5       �� -   5        $��scroller��5       $	��720��6/   .��5!      �� -   5        $��TaskText��5!       $
��left=�60   
�������$
��Auto��6Y   5"      5#      5$      � 5%   
   $��2��6   $ 
Horizontal=�6!   $��5,0,0,5q�6:   .+�5&      �� -- %6    � 5'      -   5         �Name$ ProgressBar��5'       � Minimum$ 0Q�6/    � Maximum$	 100Q�6;   $��10,0,0,0q�6I   $
��Left=�6\   $��20��6w   $��Center=�6�   $	��760��6�   	 J� RenderTransformOrigin$	 0.5,0.5&�6�   5(      5)      5*      5+      