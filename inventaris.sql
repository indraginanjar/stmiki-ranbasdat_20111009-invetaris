CREATE TABLE produk (kode_produk varchar(20) PRIMARY KEY,nama_produk varchar(45) UNIQUE,harga_jual integer);
CREATE TABLE pemasok (kode_pemasok varchar(20) PRIMARY KEY,nama_pemasok varchar(20) NOT NULL,alamat_pemasok varchar(45) NOT NULL,CHECK(nama_pemasok != '' AND alamat_pemasok != ''));
CREATE TABLE gudang (kode_gudang varchar(20) PRIMARY KEY,alamat_gudang varchar(45));
CREATE TABLE nota_pembelian (no_nota serial PRIMARY KEY,kode_pemasok varchar(20) REFERENCES pemasok(kode_pemasok),tanggal date DEFAULT current_date);
CREATE TABLE rincian_nota_pembelian (kode_produk varchar(20) REFERENCES produk(kode_produk),no_nota integer REFERENCES nota_pembelian(no_nota),harga_satuan integer,jumlah integer NOT NULL,CHECK(jumlah >= 20),PRIMARY KEY(kode_produk, no_nota));
CREATE TABLE stok_produk (kode_produk varchar(20) REFERENCES produk(kode_produk),kode_gudang varchar(20) REFERENCES gudang(kode_gudang),jumlah_stok integer NOT NULL,CHECK(jumlah_stok <= 200),PRIMARY KEY(kode_produk, kode_gudang));
