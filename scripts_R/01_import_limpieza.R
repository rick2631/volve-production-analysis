# ================================
# 01 - IMPORTE Y LIMPIEZA INICIAL
# ================================

library(tidyverse)
library(lubridate)
library(janitor)
library(readxl)

# 2. Importar datos desde Excel
daily <- read_excel("datos_originales/Volve production data.xlsx", 
                    sheet = "Daily Production Data")

monthly <- read_excel("datos_originales/Volve production data.xlsx", 
                      sheet = "Monthly Production Data")

# 3. Revisar estructura inicial
glimpse(daily)
glimpse(monthly)

# 4. Limpiar nombres de columnas
daily <- clean_names(daily)
monthly <- clean_names(monthly)

# 5. Producción total de petróleo por pozo
prod_pozo <- daily %>% 
  group_by(npd_well_bore_name) %>% 
  summarise(total_oil = sum(bore_oil_vol, na.rm = TRUE)) %>% 
  arrange(desc(total_oil))

# 6. Explorar tabla de producción por pozo
view(prod_pozo)

# 7. Guardar resumen de producción por pozo
write_csv(prod_pozo, "datos_limpios/prod_pozo.csv")

library(tidyverse)

prod_pozo <- daily %>%
  group_by(npd_well_bore_name) %>%
  summarise(total_oil = sum(bore_oil_vol, na.rm = TRUE)) %>%
  arrange(desc(total_oil))

write_csv(prod_pozo, "datos_limpios/prod_pozo.csv")

