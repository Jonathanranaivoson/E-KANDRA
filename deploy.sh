# Raha Windows nareo dia avadika .bat ito


# ETO MI-LANCE AN LE TOMCAT (TONGA DIA AUTOMATIQUEMENT START LE TOMCAT)

TOMCAT_HOME="/opt/tomcat" # Adapteo le chemin selon an le emplacement le tomcat nareo 
TOMCAT_WEBAPPS="$TOMCAT_HOME/webapps"
TOMCAT_BIN="$TOMCAT_HOME/bin"

# Repertoires an du projet
SRC_DIR="src"
WEB_DIR="webapp"
CLASSES_DIR="$WEB_DIR/WEB-INF/classes"
LIB_DIR="$WEB_DIR/WEB-INF/lib"
WAR_NAME="E-kandra.war"

# ============================================
# NETTOYAGE

echo ""
echo "1. Nettoyage des anciennes classes..."
rm -rf $CLASSES_DIR/*
mkdir -p $CLASSES_DIR

# Suppression de l'ancien WAR et redeploiement du dossier apres recompilation
if [ -f "$TOMCAT_WEBAPPS/$WAR_NAME" ]; then
    echo "   Suppression de l'ancien WAR dans Tomcat..."
    rm -f "$TOMCAT_WEBAPPS/$WAR_NAME"
fi

if [ -d "$TOMCAT_WEBAPPS/E-kandra" ]; then
    echo "   Suppression de l'ancien dossier déployé..."
    rm -rf "$TOMCAT_WEBAPPS/E-kandra"
fi

echo "   ✓ Nettoyage terminé"


# ============================================
echo ""
echo "2. Vérification du driver PostgreSQL..."
if [ -f "$LIB_DIR/postgresql-42.7.1.jar" ] || [ -f "$LIB_DIR/postgresql-42.7.1.jar" ]; then
    echo "   ✓ Driver PostgreSQL trouvé"
else
    echo "   ✗ Driver PostgreSQL  manquant (postgresql-42.7.1.jar)"
    echo "   Veuillez placer le driver dans $LIB_DIR"
    exit 1
fi


# ============================================
# Compilation des sources Java (le fichier .java)
echo ""
echo "3. Compilation des sources Java..."
javac -d $CLASSES_DIR -cp "$LIB_DIR/*" -encoding UTF-8 $(find $SRC_DIR -name "*.java")

if [ $? -eq 0 ]; then
    echo "   ✓ Compilation réussie"
else
    echo "   ✗ Erreur lors de la compilation"
    echo ""
    echo "Conseil : Vérifiez les erreurs ci-dessus"
    exit 1
fi


# ============================================
# Création du fichier WAR izay ho deployena ao am tomcat
echo ""
echo "4. Création du fichier WAR..."
cd $WEB_DIR
jar -cvf ../$WAR_NAME * > /dev/null 2>&1
cd ..

if [ $? -eq 0 ]; then
    echo "   ✓ $WAR_NAME créé avec succès"
else
    echo "   ✗ Erreur lors de la création du WAR"
    exit 1
fi



# ============================================
# Arret an le tomcat avant an le redeploiement
echo ""
echo "5. Arrêt de Tomcat..."
if [ -f "$TOMCAT_BIN/shutdown.sh" ]; then
    $TOMCAT_BIN/shutdown.sh > /dev/null 2>&1
    
    # Attendre que Tomcat s'arrête complètement
    sleep 2
    
    # Vérifier si Tomcat est vraiment arrêté
    if pgrep -f "catalina" > /dev/null; then
        echo "   ! Tomcat ne s'est pas arrêté normalement, forçage..."
        pkill -9 -f "catalina"
        sleep 1
    fi
    
    echo "   ✓ Tomcat arrêté"
else
    echo "   ✗ Script shutdown.sh introuvable dans $TOMCAT_BIN"
    exit 1
fi



# ============================================
# Redeploiement an le projet (le .war zany)

echo ""
echo "6. Déploiement du WAR dans Tomcat..."
cp $WAR_NAME "$TOMCAT_WEBAPPS/"

if [ $? -eq 0 ]; then
    echo "   ✓ WAR copié dans $TOMCAT_WEBAPPS"
else
    echo "   ✗ Erreur lors de la copie du WAR"
    exit 1
fi

# ============================================
# Redemmarage an le tomcat 

echo ""
echo "7. Démarrage de Tomcat..."
if [ -f "$TOMCAT_BIN/startup.sh" ]; then
    $TOMCAT_BIN/startup.sh
    
    if [ $? -eq 0 ]; then
        echo "   ✓ Tomcat démarré"
    else
        echo "   ✗ Erreur lors du démarrage de Tomcat"
        exit 1
    fi
else
    echo "   ✗ Script startup.sh introuvable dans $TOMCAT_BIN"
    exit 1
fi

