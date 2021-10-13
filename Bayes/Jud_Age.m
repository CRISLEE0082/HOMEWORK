function Age_Jud=Jud_Age(Age_Value)
if (Age_Value<=10)
        Age_Jud=0;
elseif (Age_Value>10&&Age_Value<15)
         Age_Jud=1;
elseif (Age_Value>=15&&Age_Value<20)
         Age_Jud=2;
elseif (Age_Value>=20&&Age_Value<40)
         Age_Jud=3;
else
         Age_Jud=4;

end

end