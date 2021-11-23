with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Randompackage; use Randompackage;

procedure main is
   val :  array (1 .. 2) of Integer := (2,1);
   K : array (1 .. 2) of Integer := (1,1);
   czyja_kolej : Integer := 1;

   procedure wyswietl (i,l : in Integer) is
   begin
      Put("Zadanie ");
      Put(l,2);
      Put(" po raz ");
      Put(i,2);
   end wyswietl;

   task type wyswietlanko(nr_zadania : Integer);

   task body wyswietlanko is
      N : Integer;
      i : Integer;
      kolumna : Integer;
      delayTime : Integer;
   begin
      N := 10;
      i := 1;
      kolumna := (nr_zadania-1)*22 +1;
      --Delay(Standard.Duration(Float(nr_zadania)/10.0));
      for i in 1..N loop
         -- sekcja lokalna BEG
         delayTime := RandomInt(5);
         Delay(Standard.Duration(delayTime));
         -- sekcja lokalna END


         K(nr_zadania) := 0;
         while K(val(nr_zadania)) = 0 loop
            if czyja_kolej = val(nr_zadania) then
               K(nr_zadania) := 1;
               while czyja_kolej = val(nr_zadania) loop
                  null;
               end loop;
               K(nr_zadania) := 1;
            end if;
         end loop;


         -- sekcja krytyczna BEG
         Set_Col(Positive_Count(kolumna));
         wyswietl(i,nr_zadania);
         -- sekcja krytyczna END


         K(nr_zadania) := 1;
         czyja_kolej := val(nr_zadania);

      end loop;

   end wyswietlanko;

   zadanko1 : wyswietlanko(1);
   zadanko2 : wyswietlanko(2);

begin
   null;
end main;
