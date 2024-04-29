<html>
    <head>
        <title>vol</title>
        <link rel ="stylesheet" media ="screen" type="text/css" href="formatage.css"/>
        <?php
        function recuperer_numeros_avion(){
            global $numeroa;
            include ("connexion_bd.php");
            $sql ="select numeroa from avion";
            $sql= $db->prepare ($sql);
            $sql-> execute();
            echo "<select name=\"numeroa\"onchange=\"submit()\">";
            $a="";
            echo '<option value="'.$a.'">'.$a.'</option>';
            while($donnees =$sql->fetch(PDO:: FETCH_ASSOC)){
                $a=$donnees['numeroa'];
                if($a==$numeroa){
                    echo'<option value ="'.$a.'"selected>'.$a.'</option>';
                }else{
                    echo'<option value="'.$a.'">'.$a.'</option>';
                
                }
            }
            $sql->closecursor();
            echo"</select>";

        }
        
        
        function recuperer_aeroport_depart(){
            global $noma_part_de;
            include ("connexion_bd.php");
            $sql ="select noma from aeroport";
            $sql= $db->prepare ($sql);
            $sql-> execute();
            echo "<select name=\"noma_part_de\"onchange=\"submit()\">";
            $a="";
            echo '<option value="'.$a.'">'.$a.'</option>';
            while($donnees =$sql-> fetch (PDO:: FETCH_ASSOC)){
                $a=$donnees['noma'];
                if($a==$noma_part_de){
                    echo'<option value ="'.$a.'"selected>'.$a.'</option>';
                
                }else{
                     echo'<option value="'.$a.'">'.$a.'</option>';
                }
            }
            $sql->closecursor();
            echo"</select>";

        }
        
        
        function recuperer_aeroport_arrivee(){
            global $noma_arrivee_a;
            include ("connexion_bd.php");
            $sql ="select noma from aeroport";
            $sql= $db->prepare ($sql);
            $sql-> execute();
            echo "<select name=\"noma_arrivee_a\"onchange=\"submit()\">";
            $a=" ";
            echo '<option value="'.$a.'">'.$a.'</option>';
            while($donnees =$sql-> fetch (PDO:: FETCH_ASSOC)){
                $a=$donnees['noma'];
                if($a==$noma_arrivee_a){
                    echo'<option value ="'.$a.'"selected>'.$a.'</option>';
                }else{ 
                        echo'<option value="'.$a.'">'.$a.'</option>';
                    }
                   
                
                }
                $sql->closecursor();
                echo"</select>";
            }
           

        ?>
      
      </head>
      <body>
        <?php
        $numerov="";
        $jour="";
        $heure_depart="";
        $heure_arrivee="";
        $numeroa="";
        $noma_part_de="";
        $noma_arrivee_a="";
        $placelibre=0;
        if(isset($_POST ['numerov'])){
            $numerov=$_POST['numerov'];
        }
        if(isset($_POST ['jour'])){
            $jour=$_POST['jour'];
        }
        if(isset($_POST ['heure_depart'])){
            $heure_depart=$_POST['heure_depart'];
        }
        if(isset($_POST ['heure_arrivee'])){
            $heure_arrivee=$_POST['heure_arrivee'];
        }
        if(isset($_POST ['numeroa'])){
            $numeroa=$_POST['numeroa'];
        }
        
        if(isset($_POST ['noma_part_de'])){
            $noma_part_de=$_POST['noma_part_de'];
        }
        if(isset($_POST ['noma_arrivee_a'])){
            $noma_arrivee_a=$_POST['noma_arrivee_a'];
        }
        if(isset($_POST ['placelibre'])){
            $placelibre=intval($_POST['placelibre']);
        }
        ?>
        <form action ="#" method="POST">
            <table border ="0" align ="center">
                <caption> Enregistrement des vols</caption>
                <TR><TD>Numero du vol </TD><TD> 
                <INPUT type ="text" name ="numerov" size="20" value ="<?php echo $numerov; ?>"> </TD></TR>
                <TR><TD> Numero avion </TD><TD><?php recuperer_numeros_avion();?></TD></TR>
                <TR><TD> Aeroport depart </TD><TD><?php recuperer_aeroport_depart();?></TD></TR>
                <TR><TD> Aeroport d'arrivee </TD><TD><?php recuperer_aeroport_arrivee();?></TD></TR>
    </table>
    </form>
    </body>
    </html>


    