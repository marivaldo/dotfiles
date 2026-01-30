# Cria layout de desenvolvimento no Kitty
# +------------------+--------+
# |                  |   top  |
# |                  +--------+
# |      VIM         |  mid   |
# |                  +--------+
# |                  | bottom |
# +------------------+--------+

function dev_layout
    # Cria 3 janelas extras
    kitty @ launch --cwd=current
    kitty @ launch --cwd=current
    kitty @ launch --cwd=current

    # Usa layout tall: 1 grande na esquerda, resto empilhado na direita
    kitty @ goto-layout tall

    # Foca na primeira janela (painel principal)
    kitty @ focus-window --match num:0

    # Redimensiona o painel principal para 70%
    kitty @ resize-window --increment 50
end
