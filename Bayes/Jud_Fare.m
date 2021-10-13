function Fare_Jud=Jud_Fare(Fare_Value)
if(Fare_Value<=20)
        Fare_Jud=0;
elseif(Fare_Value>20&&Fare_Value<=40)
         Fare_Jud=1;
elseif(Fare_Value>40&&Fare_Value<=60)
         Fare_Jud=2;
elseif(Fare_Value>60&&Fare_Value<=80)
         Fare_Jud=3;
else
         Fare_Jud=4;

end

end