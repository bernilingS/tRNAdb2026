select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name, parent_clades.parent_class_order, count(*) from parent_clades, trna_sequences where (parent_class_order="domain" OR parent_name="Viruses") AND parent_clades.tax=trna_sequences.tax GROUP BY parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name, parent_clades.parent_class_order ORDER BY parent_clades.parent_name ASC;
--> All domains and viruses for trna_sequences.

select parent_clades.parent_name, parent_clades.parent_class_order, count(*) fro
m parent_clades, trna_sequences where (parent_class_order="domain" OR parent_name="Viru
ses") AND parent_clades.tax=trna_sequences.tax GROUP BY parent_clades.parent_name, pare
nt_clades.parent_class_order ORDER BY parent_clades.parent_name ASC;
--> All domains with the resp. sequence count for trna_sequences.

select parent_name, parent_class_order, count(*) from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, trna_sequences.full_seq from parent_clades, trna_sequences where (parent_class_order="domain" OR parent_name="Viruses") AND parent_clades.tax=trna_sequences.tax ORDER BY parent_clades.parent_name) as t GROUP BY parent_name, parent_class_order;
--> All domains unique sequence count with resp. count for trna_sequences 

select parent_name, parent_class_order, count(*) from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, trna_sequences.full_seq from parent_clades, trna_sequences where (parent_class_order="kingdom") AND parent_clades.tax=trna
_sequences.tax ORDER BY parent_clades.parent_name) as t GROUP BY parent_name, parent_cl
ass_order;
--> All eukaryotic kingdoms with unique seq counts for trna_sequences.

select parent_clades.parent_name, parent_clades.parent_class_order, count(*) fro
m parent_clades, trna_sequences where (parent_class_order="kingdom") AND parent_clades.
tax=trna_sequences.tax GROUP BY parent_clades.parent_name, parent_clades.parent_class_o
rder ORDER BY parent_clades.parent_name ASC;
--> All eukaryotic kingdoms duplicate sequences allowed

select parent_name, parent_class_order from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, mttrna_sequences.full_seq from parent_clades, mttrna_sequences where (parent_class_order="kingdom") AND parent_clades.tax=mttrna_sequences.tax GROUP BY parent_clades.parent_name, parent_clades.parent_class_order ORDER BY parent_clades.parent_name ASC) as t GROUP BY parent_name,parent_class_order;
--> All kindgoms with distinct 
