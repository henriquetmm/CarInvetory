CREATE OR REPLACE VIEW invoice_view AS
    SELECT v.serial,v.make,v.model,v.cyear,v.color,c.*,s.saleinv,s.saledate,s.tradeserial,s.salesman,s.fire,s.collision,s.liability,s.property,s.totalprice,s.tradeallow,s.discount,s.net,s.tax,s.licfee,s.commission
    FROM saleinv s
    INNER JOIN customer c
    ON s.cname = c.cname
    INNER JOIN car v
    ON s.serial = v.serial;
    
    