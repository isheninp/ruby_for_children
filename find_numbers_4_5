```
# Функция дает ответ, делится ли число на 4 И 5 ?
def cannot_deleted_by_4_or_5(x)
  not ((x % 4) == 0 and (x % 5) ==0) # делится, если остаток от деления == 0
end

# Функция ищет последнее 
# число в ряду из N натуральных чисел, 
# которые не делится на 4 И 5
def find_num(n)
  x=0
  nfound=0
  while nfound < n
    x+=1
    if cannot_deleted_by_4_or_5(x)
      nfound+=1
    end
    # p "x=#{x}"
    # p "cannot_deleted_by_4_or_5=#{cannot_deleted_by_4_or_5(x)}"
    # p '---'
  end
  return x
end

# Решаем задачку:
puts find_num(366)
```
