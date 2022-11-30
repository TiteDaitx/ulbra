3 select p.nome, as produto, p.preço, v.data_venda 
  1 from produtos p, vendas_itens vi, vendas v
      2 where p.id = vi.id_produtos and
            vi.id_venda = v.id  and
            v.data_venda >= '2022 -11 -01' and 
            v.data_venda <= '2022 - 11 -30';

    -- mostrar o valor total das vendas 1001

    select  sum (quantidade* valor_unitario) as total
        from vendas_itens 
             where id_venda = 1001;

    -- listar os produtos vendidos no mes de outubro do menos preço vendido ao maior
    select  p.id, p,nome, vi.valor_unitario 
        from produto p , vendas v, vendas_itens vi
             where p.id = vi.id_produtos and 
                   vi.id_venda = v.id and 
                   v. data_venda >= "2022-10-01" and
                   v. data_venda <= "2022-10-30"
                   order by vi. valor_unitario asc;