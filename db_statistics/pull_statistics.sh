mysql -u root -p -e "select AMS, AC, count(*) from merged_trna.trna_sequences GROUP BY AMS, AC ORDER BY AMS DESC;" > nuclear_trna_AMS_AC.tsv

mysql -u root -p -e "SELECT AMS, AC, COUNT(*) FROM (select distinct AMS, AC, FULL_SEQ from merged_trna.trna_sequences) AS t GROUP BY AMS, AC ORDER BY AMS ASC;" > nuclear_trna_AMS_AC_unique_sequence.tsv

mysql -u root -p -e "SELECT AMS, REPLACE(AC, 'U', 'T') as cleanAC, COUNT(*) FROM (select distinct AMS, AC, FULL_SEQ from merged_trna.mttrna_sequences) AS t GROUP BY AMS, cleanAC ORDER BY AMS ASC;" > mito_trna_AMS_AC_unique_sequence_no_U.tsv

mysql -u root -p -e "select AMS, REPLACE(AC, 'U', 'T') as cleanAC, COUNT(*) from merged_trna.mttrna_sequences GROUP BY AMS, cleanAC ORDER BY AMS ASC;" > mito_trna_AMS_AC_no_U.tsv

mysql -u root -p -e "select merged_trna.parent_clades.tax, merged_trna.parent_clades.tax_name, merged_trna.parent_clades.parent_name, merged_trna.parent_clades.parent_class_order, count(*) from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_clades.parent_class_order='domain' OR parent_clades.parent_name='Viruses') AND merged_trna.parent_clades.tax=merged_trna.trna_sequences.tax GROUP BY merged_trna.parent_clades.tax, merged_trna.parent_clades.tax_name, merged_trna.parent_clades.parent_name, merged_trna.parent_clades.parent_class_order ORDER BY merged_trna.parent_clades.parent_name ASC;" > nuclear_trna_sequences_per_domain_species.tsv

mysql -u root -p -e "select parent_clades.parent_name, parent_clades.parent_class_order, count(*) from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' OR parent_name='Viruses') AND parent_clades.tax=trna_sequences.tax GROUP BY parent_clades.parent_name, parent_clades.parent_class_order ORDER BY parent_clades.parent_name ASC;" > nuclear_trna_sequences_for_domains.tsv

mysql -u root -p -e "select parent_name, parent_class_order, count(*) from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, trna_sequences.full_seq from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' OR parent_name='Viruses') AND parent_clades.tax=trna_sequences.tax ORDER BY parent_clades.parent_name) as t GROUP BY parent_name, parent_class_order;" > nuclear_trna_unique_sequences_for_domain.tsv

mysql -u root -p -e "select parent_clades.parent_name, parent_clades.parent_class_order, count(*) from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND parent_clades.tax=mttrna_sequences.tax GROUP BY parent_clades.parent_name, parent_clades.parent_class_order ORDER BY parent_clades.parent_name ASC;" > mito_trna_sequences_per_kingdom.tsv

mysql -u root -p -e "select parent_name, parent_class_order, count(*) from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, mttrna_sequences.full_seq from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND parent_clades.tax=mttrna_sequences.tax ORDER BY parent_clades.parent_name ASC) as t GROUP BY parent_name, parent_class_order;" > mito_unique_trna_sequences_per_kingdom.tsv

mysql -u root -p -e "SELECT parent_name, count(*) FROM (SELECT parent_name, tax, tax_name, count(*) as c FROM (select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name, trna_sequences.full_seq from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' or parent_name='Viruses') AND trna_sequences.version!=1 AND parent_clades.tax=trna_sequences.tax) as t GROUP BY parent_name, tax, tax_name) AS t2 GROUP BY parent_name;" > NEW_nuclear_trna_species.tsv

mysql -u root -p -e "SELECT parent_name, count(*) FROM (SELECT parent_name, tax, tax_name, count(*) as c FROM (select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name,
trna_sequences.full_seq from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' or parent_name='Viruses') AND parent_clades.tax=trna_sequences.tax) as t GROUP BY parent_name, tax, tax_name) AS t2 GROUP BY parent_name;" > ALL_nuclear_trna_species.tsv

mysql -u root -p -e "SELECT parent_name, count(*) FROM (SELECT parent_name, tax, tax_name, count(*) as c FROM (select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name,
mttrna_sequences.full_seq from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND mttrna_sequences.version!=1 AND parent_clades.tax=mttrna_sequences.tax) as t GROUP BY parent_name, tax, tax_name) AS t2 GROUP BY parent_name;" > NEW_mito_trna_species.tsv

mysql -u root -p -e "SELECT parent_name, count(*) FROM (SELECT parent_name, tax, tax_name, count(*) as c FROM (select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name,
mttrna_sequences.full_seq from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND parent_clades.tax=mttrna_sequences.tax) as t GROUP BY parent_name, tax, tax_name) AS t2 GROUP BY parent_name;" > ALL_mito_trna_species.tsv


# ---------------------------------


mysql -u root -p -e "select AMS, AC, count(*) from merged_trna.trna_sequences WHERE trna_sequences.version=1 GROUP BY AMS, AC ORDER BY AMS DESC;" > OLDDB_nuclear_trna_AMS_AC.tsv

mysql -u root -p -e "SELECT AMS, AC, COUNT(*) FROM (select distinct AMS, AC, FULL_SEQ from merged_trna.trna_sequences WHERE trna_sequences.version=1) AS t GROUP BY AMS, AC ORDER BY AMS ASC;" > OLDDB_nuclear_trna_AMS_AC_unique_sequence.tsv

mysql -u root -p -e "SELECT AMS, REPLACE(AC, 'U', 'T') as cleanAC, COUNT(*) FROM (select distinct AMS, AC, FULL_SEQ from merged_trna.mttrna_sequences WHERE mttrna_sequences.version=1) AS t GROUP BY AMS, cleanAC ORDER BY AMS ASC;" > OLDDB_mito_trna_AMS_AC_unique_sequence_no_U.tsv

mysql -u root -p -e "select AMS, REPLACE(AC, 'U', 'T') as cleanAC, COUNT(*) from merged_trna.mttrna_sequences WHERE mttrna_sequences.version=1 GROUP BY AMS, cleanAC ORDER BY AMS ASC;" > OLDDB_mito_trna_AMS_AC_no_U.tsv

mysql -u root -p -e "select merged_trna.parent_clades.tax, merged_trna.parent_clades.tax_name, merged_trna.parent_clades.parent_name, merged_trna.parent_clades.parent_class_order, count(*) from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_clades.parent_class_order='domain' OR parent_clades.parent_name='Viruses') AND merged_trna.parent_clades.tax=merged_trna.trna_sequences.tax AND trna_sequences.version=1 GROUP BY merged_trna.parent_clades.tax, merged_trna.parent_clades.tax_name, merged_trna.parent_clades.parent_name, merged_trna.parent_clades.parent_class_order ORDER BY merged_trna.parent_clades.parent_name ASC;" > OLDDB_nuclear_trna_sequences_per_domain_species.tsv

mysql -u root -p -e "select parent_clades.parent_name, parent_clades.parent_class_order, count(*) from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' OR parent_name='Viruses') AND trna_sequences.version=1 AND parent_clades.tax=trna_sequences.tax GROUP BY parent_clades.parent_name, parent_clades.parent_class_order ORDER BY parent_clades.parent_name ASC;" > OLDDB_nuclear_trna_sequences_for_domains.tsv

mysql -u root -p -e "select parent_name, parent_class_order, count(*) from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, trna_sequences.full_seq from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' OR parent_name='Viruses') AND trna_sequences.version=1 AND parent_clades.tax=trna_sequences.tax ORDER BY parent_clades.parent_name) as t GROUP BY parent_name, parent_class_order;" > OLDDB_nuclear_trna_unique_sequences_for_domain.tsv

mysql -u root -p -e "select parent_clades.parent_name, parent_clades.parent_class_order, count(*) from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND mttrna_sequences.version=1 AND parent_clades.tax=mttrna_sequences.tax GROUP BY parent_clades.parent_name, parent_clades.parent_class_order ORDER BY parent_clades.parent_name ASC;" > OLDDB_mito_trna_sequences_per_kingdom.tsv

mysql -u root -p -e "select parent_name, parent_class_order, count(*) from (select distinct parent_clades.parent_name, parent_clades.parent_class_order, mttrna_sequences.full_seq from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND mttrna_sequences.version=1 AND parent_clades.tax=mttrna_sequences.tax ORDER BY parent_clades.parent_name ASC) as t GROUP BY parent_name, parent_class_order;" > OLDDB_mito_unique_trna_sequences_per_kingdom.tsv

mysql -u root -p -e "SELECT parent_name, count(*) FROM (SELECT parent_name, tax, tax_name, count(*) as c FROM (select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name, trna_sequences.full_seq from merged_trna.parent_clades, merged_trna.trna_sequences where (parent_class_order='domain' or parent_name='Viruses') AND trna_sequences.version=1 AND parent_clades.tax=trna_sequences.tax) as t GROUP BY parent_name, tax, tax_name) AS t2 GROUP BY parent_name;" > OLDDB_nuclear_trna_species.tsv


mysql -u root -p -e "SELECT parent_name, count(*) FROM (SELECT parent_name, tax, tax_name, count(*) as c FROM (select parent_clades.tax, parent_clades.tax_name, parent_clades.parent_name,
mttrna_sequences.full_seq from merged_trna.parent_clades, merged_trna.mttrna_sequences where (parent_class_order='kingdom') AND mttrna_sequences.version=1 AND parent_clades.tax=mttrna_sequences.tax) as t GROUP BY parent_name, tax, tax_name) AS t2 GROUP BY parent_name;" > OLDDB_mito_trna_species.tsv
