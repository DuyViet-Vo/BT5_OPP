class CanBo
    attr_accessor :hoTen, :tuoi, :gioiTinh, :diaChi
    def initialize(hoTen,tuoi,gioiTinh,diaChi)
        @hoTen = hoTen
        @tuoi = tuoi
        @gioiTinh = gioiTinh
        @diaChi == diaChi
    end
    def inputInfor
        print "Nhập tên : "
        @hoTen = gets.chomp
        print "Nhập tuổi : "
        @tuoi = gets.to_i
        print "Nhập giới tính 1(nam) 0(nữ) 2(khác) : "
        @gioiTinh = gets.to_i
        print "Nhập địa chỉ : "
        @diaChi = gets.chomp
    end
    def show   
        puts "Tên : #{@hoTen}"
        puts "Tuối : #{@tuoi}"
        if @gioiTinh == 1 
            puts'Giới tính : Nam'
        elsif @gioiTinh == 0
            puts 'Giới Tính : Nữ'
        else 
            puts 'Giới Tính : Khác'
        end
        puts "Địa chỉ : #{@diaChi}"
    end
end
#class của công nhân kế thừa cán bộ
class CongNhan < CanBo
    attr_accessor :hoTen, :tuoi, :gioiTinh, :diaChi,:bac
    def inputInfor
        super
        puts "Nhập bậc: "
        @bac = gets.chomp
    end
    def show
        super
        puts "Bậc : #{@bac}"
    end
end

#class của kỹ sư kế thừa Cán bộ
class KySu < CanBo
    attr_accessor :hoTen, :tuoi, :gioiTinh, :diaChi,:nganhDaoTao
    def inputInfor
        super
        puts "Nhập ngành"
        @nganhDaoTao = gets.chomp
    end
    def show
        super
        puts "Ngành : #{@nganhDaoTao}"
    end
end

#Class của Nhân viên kế thừa cán bộ
class NhanVien < CanBo
    attr_accessor :hoTen, :tuoi, :gioiTinh, :diaChi,:congViec
    def inputInfor
        super
        puts "Nhập công việc: "
        @congViec = gets.chomp
    end
    def show
        super
        puts "Công việc : #{@congViec}"
    end
end

class QLCB
    $quanLy = []
    def addCanbo
        puts"1. Nhâp công nhân :"
        puts"2. Nhâp Ky su :"
        puts"3. Nhập Nhân viên :"
        print "Mơi bạn chon : "
        choose = gets.to_i
        if choose ==1 
            canbo =CongNhan.new
         
        elsif choose == 2
            canbo =KySu.new
        else 
            canbo = NhanVien.new
        end
        canbo.enter_infomation
        $quanLy << canbo       
    end
    def infomatinon 
        puts "============Danh sách cán bộ là================"    
        $quanLy.each do |canbo|
            puts canbo.show
        end
    end

end
$n= true
while $n
    QL = QLCB.new
    puts "Thêm mới cán bộ nhấn phim : 1"
    puts "Tìm kiếm theo tên nhấn phím : 2"
    puts "Hiện thị thông tin danh sách cán bộ nhấn phim : 3"
    puts "Thoát nhấn phím : 4"
    
    puts "Mời chọn: "
    choose = gets.to_i

    case choose
    when 1
        QL.addCanbo
    when 2
        
    when 3
        QL.infomatinon
    else
        $continute = false
    end
end