clear
# -n poprzedza wierz out numerem wiersza in, od 1
# -e dopasuj do wzorca

while [ 1 ]; do echo '==========='; echo potoczek; echo plynie i skacze; echo;  sleep 1s; done | tee >(grep -n -e potoczek) >(grep -ne plynie) >(grep -ne skacze)


