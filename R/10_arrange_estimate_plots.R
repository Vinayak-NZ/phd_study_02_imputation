## ---- arrange-treatment-effects-plots

# self-care

plot_sc_mcar <-
  plot_grid(plot_estimates_sc_mcar_20, 
            plot_estimates_sc_mcar_30, 
            plot_estimates_sc_mcar_40,
            labels = "AUTO")

plot_sc_mar <-
  plot_grid(plot_estimates_sc_mar_20, 
            plot_estimates_sc_mar_30, 
            plot_estimates_sc_mar_40,
            labels = "AUTO")

plot_sc_mnar <-
  plot_grid(plot_estimates_sc_mnar_20, 
            plot_estimates_sc_mnar_30, 
            plot_estimates_sc_mnar_40,
            labels = "AUTO")

# physical-activity

plot_pa_mcar <-
  plot_grid(plot_estimates_pa_mcar_20, 
            plot_estimates_pa_mcar_30, 
            plot_estimates_pa_mcar_40,
            labels = "AUTO")

plot_pa_mar <-
  plot_grid(plot_estimates_pa_mar_20, 
            plot_estimates_pa_mar_30, 
            plot_estimates_pa_mar_40,
            labels = "AUTO")

plot_pa_mnar <-
  plot_grid(plot_estimates_pa_mnar_20, 
            plot_estimates_pa_mnar_30, 
            plot_estimates_pa_mnar_40,
            labels = "AUTO")
