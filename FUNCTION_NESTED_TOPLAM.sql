-- Function
-- 1.Nested Function: Unnamed Bloklarda yazilan fonksiyonlar. Veritabaninda saklanmaz.
-- 2.Developer Defined Function: Standalone ya da Package icinde yazilir. Veritabaninda saklanir.


--- Nested Function ---
-- Unnamed Block icinde, toplam bulan bir fonksiyon yazalim.

Declare
   z number;
   Function toplam (x number, y number) Return number IS
       s number;
   Begin
       s := x + y;
       return (s);
   End;
Begin
  Z := toplam (4,5);
  Dbms_Output.put_line('Toplam = ' || z);     
End;
