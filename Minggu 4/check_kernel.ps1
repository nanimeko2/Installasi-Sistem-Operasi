Set-ExecutionPolicy Bypass -Scope Process -Force



Write-Host "=== LAPORAN KERNEL WINDOWS ===" -ForegroundColor Cyan
# Mengambil dan menampilkan tanggal & waktu saat script dijalankan
Write-Host "Tanggal: $(Get-Date)"
Write-Host "--------------------------------"

# Mendapatkan info OS melalui WMI (Windows Management Instrumentation)
# Menyimpan seluruh informasi sistem operasi ke dalam variabel $os
$os = Get-CimInstance Win32_OperatingSystem
# Menampilkan spesifikasi OS berdasarkan variabel yang sudah diambil
Write-Host "Nama OS       : $($os.Caption)"
Write-Host "Versi Kernel  : $($os.Version)"
Write-Host "Build Number  : $($os.BuildNumber)"

Write-Host "--------------------------------"
Write-Host "INFO HARDWARE (CPU):"
# Mengambil data prosesor (CPU) dan memfilter agar hanya menampilkan Nama, Jumlah Core, dan Kecepatan Maksimal
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed

Write-Host "--------------------------------"
Write-Host "STATUS MEMORI:"
# Mengambil data RAM fisik dan memfilter agar hanya menampilkan Kapasitas dan Kecepatannya
Get-CimInstance Win32_PhysicalMemory | Select-Object Capacity, Speed