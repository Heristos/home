local component = require("component")
local event = require("event")
local gpu = component.gpu
local shell = require("shell")

-- Taille de l'écran
gpu.setResolution(80, 25)
local largeur, hauteur = gpu.getResolution()

-- Couleurs
local couleurFond = 0xFFFFFF -- Blanc
local couleurTexte = 0x286CFF -- Bleu
local couleurTitre2 = 0xFFAE28 -- Doré

-- Fonction pour dessiner la GUI
local function dessinerGUI()
  -- Fond blanc
  gpu.setBackground(couleurFond)
  gpu.fill(1, 1, largeur, hauteur, " ")

  -- Titre centré en haut (MineBank)
  local titre = "MineBank"
  local titreX = math.floor(largeur / 2) - math.floor(#titre / 2)
  gpu.setForeground(couleurTitre2)
  gpu.set(titreX, 1, titre)

  -- Titre2 (login)
  local titre2 = "Login"
  local titre2X = math.floor(largeur / 2) - math.floor(#titre2 / 2)
  gpu.setForeground(couleurTexte)
  gpu.set(titre2X, 8, titre2)
end

-- Appel de la fonction pour dessiner la GUI initiale
dessinerGUI()

-- Fonction pour vérifier les informations de connexion
local function login()
  os.execute("clear")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print("                               === Connexion ===")
  print("                   Veuillez saisir votre nom d'utilisateur :")
  local username = io.read()
  
  print("                     Veuillez saisir votre mot de passe :")
  local password = io.read()
  
  local file = io.open("account.txt", "r")
  
  if file then
    for line in file:lines() do
      local savedUsername, savedPassword, balance = line:match("(.*),(.*),(.*)")
      
      if savedUsername == username and savedPassword == password then
        file:close()
        print("                       Connexion réussie !")
        os.execute("clear")
        print("Connexion.")
        os.execute("sleep 2")
        os.execute("clear")
        print("Connexion..")
        os.execute("sleep 2")
        os.execute("clear")
        print("Connexion...")
        os.execute("sleep 2")
        os.execute("clear")
        print("Connexion.")
        os.execute("sleep 2")
        os.execute("clear")
        print("Connexion..")
        os.execute("sleep 2")
        os.execute("clear")
        print("Connexion...")
        os.execute("sleep 2")
        os.execute("clear")
        print(" MineBank")
        print(" ")
        print(" ")
        print(" ")
        print(" ")
        print("              Money : " .. balance)
        return true
      end
    end
    
    file:close()
    print("               Nom d'utilisateur ou mot de passe incorrect.")
    return false
  else
    print("                  Erreur lors de l'ouverture du fichier.")
    return false
  end
end

-- Appel de la fonction de connexion
login()

-- Boucle principale pour gérer les événements
while true do
  local _, _, x, y = event.pull("touch")
  -- Ajoutez ici la logique de gestion des événements selon les coordonnées x, y
end
