drop database if exists quan_ly_vat_lieu;
create database if not exists quan_ly_vat_lieu;
use quan_ly_vat_lieu;
create table if not exists vat_tu(
id int primary key auto_increment,
ma_vat_tu varchar(255),
ten_vat_tu varchar(255),
don_vi_tinh varchar(255) ,
gia_tien int
);
insert into vat_tu(ma_vat_tu,ten_vat_tu,don_vi_tinh,gia_tien) values ('v1','ximang','bao',1000),('v1','ximang','bao',1000),('v1','ximang','bao',1000),
('v1','ximang','bao',1000),('v1','ximang','bao',1000);
create table if not exists ton_kho(
id int primary key auto_increment,
vat_tu_id int,
so_luong_dau int,
tong_so_luong_nhap int,
tong_so_luong_xuat int,
foreign key (vat_tu_id) references vat_tu(id)
);
insert into ton_kho(vat_tu_id,so_luong_dau,tong_so_luong_nhap,tong_so_luong_xuat)
 values (1,2,10,9),(1,2,10,9),(1,2,10,9),(1,2,10,9),(1,2,10,9);
create table if not exists nha_cung_cap(
id int primary key auto_increment,
ma_nha_cung_cap varchar(255),
ten_nha_cung_cap varchar(255),
dia_chi varchar(255),
so_dien_thoai int

);
insert into nha_cung_cap(ma_nha_cung_cap,ten_nha_cung_cap,dia_chi,so_dien_thoai) values ('vip','phuong','da nang','123456789'),('vip','kieu anh','da nang','123456789'),
('vip','trung','da nang','123456789');
create table if not exists don_dat_hang(
id int primary key auto_increment,
ma_don varchar(255),
ngay_dat_hang date,
nha_cung_cap_id int,
foreign key (nha_cung_cap_id) references nha_cung_cap(id)
);
insert into don_dat_hang(ma_don,ngay_dat_hang,nha_cung_cap_id) values ('no','2024-01-01',1),('no','2024-01-01',1),('no','2024-01-01',1);
create table if not exists phieu_nhap(
id int primary key auto_increment,
ma_phieu_nhap varchar(255),
ngay_nhap date,
don_hang_id int,
foreign key (don_hang_id) references don_dat_hang(id)
);
insert into phieu_nhap(ma_phieu_nhap,ngay_nhap,don_hang_id) values ('23','2023-12-05',2),('23','2023-12-05',2),('23','2023-12-05',2);
create table if not exists phieu_xuat(
id int primary key auto_increment,
ma_phieu_xuat varchar(255),
ngay_xuat date,
ten_khach_hang varchar(255)
);
insert into phieu_xuat(ma_phieu_xuat,ngay_xuat,ten_khach_hang) values ('di1','2024-02-02','chanh'),('di1','2024-02-02','chanh'),('di1','2024-02-02','chanh');
create table if not exists chi_tiet_don_hang(
id int primary key auto_increment,
don_hang_id int,
vat_tu_id int,
so_luong_dat int,
foreign key (don_hang_id) references don_dat_hang(id),
foreign key (vat_tu_id) references vat_tu(id)
);
insert into chi_tiet_don_hang(don_hang_id,vat_tu_id,so_luong_dat) values (3,3,4),(3,2,4),(3,1,4),(3,3,4),(3,1,4),(3,2,4);
create table if not exists chi_tiet_phieu_nhap(
id int primary key auto_increment,
phieu_nhap_id int,
vat_tu_id int,
so_luong_nhap int,
don_gia_nhap int,
ghi_chu varchar(255),
foreign key (phieu_nhap_id) references phieu_nhap(id),
foreign key (vat_tu_id) references vat_tu(id)
);
insert into chi_tiet_phieu_nhap(phieu_nhap_id,vat_tu_id,so_luong_nhap,don_gia_nhap,ghi_chu) values (2,5,34,45000,'hàng chất lượng'),(2,5,34,45000,'hàng chất lượng'),(2,5,34,45000,'hàng chất lượng'),
(2,5,34,45000,'hàng chất lượng'),(2,5,34,45000,'hàng chất lượng');

create table if not exists chi_tiet_phieu_xuat(
id int primary key auto_increment,
phieu_xuat_id int,
vat_tu_id int,
so_luong_xuat int,
don_gia_xuat int,
ghi_chu varchar(255),
foreign key (phieu_xuat_id) references phieu_xuat(id),
foreign key (vat_tu_id) references vat_tu(id)
);
insert into chi_tiet_phieu_xuat(phieu_xuat_id,vat_tu_id,so_luong_xuat,don_gia_xuat,ghi_chu) values (3,1,3,600000,'hang ton kho'),(3,1,3,600000,'hang ton kho'),
(3,1,3,600000,'hang ton kho'),(3,1,3,600000,'hang ton kho'),(3,1,3,600000,'hang ton kho')