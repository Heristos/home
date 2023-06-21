local component = require("component")
local event = require("event")
local gpu = component.gpu
local shell = require("shell")

-- Taille de l'écran
local largeur, hauteur = gpu.getResolution()

-- Couleurs
local couleurFond = 0xFFFFFF -- Blanc
local couleurBouton = 0x286CFF -- Bleu
local couleurTexte = 0xFFAE28 -- Doré
local couleurTexteBouton = 0xFFFFFF -- Blanc

-- Position des boutons
local bouton1X = math.floor(largeur / 2) - 10
local bouton1Y = math.floor(hauteur / 2) - 1
local bouton2X = math.floor(largeur / 2) + 1
local bouton2Y = math.floor(hauteur / 2) - 1

-- Fonction pour dessiner la GUI
local function dessinerGUI()
  -- Fond blanc
  gpu.setBackground(couleurFond)
  gpu.fill(1, 1, largeur, hauteur, " ")

  -- Titre centré en haut (MineBank)
  local titre = "MineBank"
  local titreX = math.floor(largeur / 2) - math.floor(#titre / 2)
  gpu.setForeground(couleurTexte)
  gpu.set(titreX, 1, titre)

  -- Bouton 1 (Register)
  gpu.setBackground(couleurBouton)
  gpu.fill(bouton1X, bouton1Y, 10, 3, " ")
  gpu.setForeground(couleurTexteBouton)
  local texteBouton1 = "Register"
  local bouton1TexteX = bouton1X + math.floor((10 - #texteBouton1) / 2)
  local bouton1TexteY = bouton1Y + 1
  gpu.set(bouton1TexteX, bouton1TexteY, texteBouton1)

  -- Bouton 2 (Login)
  gpu.setBackground(couleurBouton)
  gpu.fill(bouton2X, bouton2Y, 10, 3, " ")
  gpu.setForeground(couleurTexteBouton)
  local texteBouton2 = "Login"
  local bouton2TexteX = bouton2X + math.floor((10 - #texteBouton2) / 2)
  local bouton2TexteY = bouton2Y + 1
  gpu.set(bouton2TexteX, bouton2TexteY, texteBouton2)
end

-- Fonction pour effacer la GUI
local function effacerGUI()
  gpu.fill(bouton1X, bouton1Y, 10, 3, " ")
  gpu.fill(bouton2X, bouton2Y, 10, 3, " ")
end

-- Appel de la fonction pour dessiner la GUI initiale
dessinerGUI()

-- Fonction pour gérer les clics sur les boutons
local function gererClic(_, _, x, y)
  -- Vérifier si les coordonnées de clic sont à l'intérieur du bouton 1 (Register)
  if x >= bouton1X and x <= bouton1X + 9 and y >= bouton1Y and y <= bouton1Y + 2 then
    effacerGUI() -- Effacer la GUI
    shell.execute("register.lua") -- Exécuter le fichier "register.lua"
  end

  -- Vérifier si les coordonnées de clic sont à l'intérieur du bouton 2 (Login)
  if x >= bouton2X and x <= bouton2X + 9 and y >= bouton2Y and y <= bouton2Y + 2 then
    effacerGUI() -- Effacer la GUI
    shell.execute("login.lua") -- Exécuter le fichier "login.lua"
  end
end

-- Boucle principale pour gérer les événements
while true do
  local _, _, x, y = event.pull("touch")
  gererClic(_, _, x, y)
end
