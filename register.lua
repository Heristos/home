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

  -- Titre2 (Register)
  local titre2 = "Register"
  local titre2X = math.floor(largeur / 2) - math.floor(#titre2 / 2)
  gpu.setForeground(couleurTexte)
  gpu.set(titre2X, 8, titre2)
end

-- Appel de la fonction pour dessiner la GUI initiale
dessinerGUI()

  -- Fonction pour vérifier si le nom d'utilisateur existe déjà
local function check_existing_name(username)
  local file = io.open("account.txt", "r")
  
  if file then
    for line in file:lines() do
      local stored_username, _, _ = string.match(line, "(.*),(.*),(.*)")
      if stored_username == username then
        file:close()
        return true
      end
    end
    file:close()
  end
  
  return false
end

-- Fonction pour enregistrer un compte
local function register()
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print(" ")
  print("                            === Enregistrement ===")
  print(" ")
  print("                  Veuillez saisir votre nom d'utilisateur :")
  local username = io.read()
  
  if check_existing_name(username) then
    print("Désolé, le nom d'utilisateur est déjà utilisé.")
    os.execute("sleep 3")
    os.execute("clear")
    os.execute("register.lua")
    return
  end

  print(" ")
  print("Veuillez saisir votre mot de passe (minimum 6 caractères) :")  
  local password = io.read()
  
  if string.len(password) < 6 then
    print("Désolé, le mot de passe doit contenir minimum 6 caractères.")
    os.execute("sleep 3")
    os.execute("clear")
    os.execute("register.lua")
    return
  end
  
  local file = io.open("account.txt", "a")
  
  if file then
    file:write(username .. "," .. password .. ",0\n")
    file:close()
    print("Compte enregistré avec succès !")
    os.execute("sleep 3")
    os.execute("app.lua")
  else
    print("Erreur lors de l'ouverture du fichier.")
  end
end

-- Appel de la fonction d'enregistrement
register()

-- Boucle principale pour gérer les événements
while true do
  local _, _, x, y = event.pull("touch")
  -- Ajoutez ici la logique de gestion des événements selon les coordonnées x, y
end
