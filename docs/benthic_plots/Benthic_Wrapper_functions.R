
plot_domain_den_by_year <- function(project = "NCRMP", region, species_filter = "NULL", title, print_dataframe = "NULL") {

  tmp <-  NCRMP_DRM_calculate_colony_density(project, region, species_filter = "NULL")

  a <- tmp$Domain_est

  p <- ggplot(a, aes(x=as.factor(YEAR), y=avDen, group = 1)) +
    geom_line(size=1) + geom_point(size=3) +
    geom_errorbar(aes(ymin = avDen - SE, ymax = avDen + SE),
                  width = 0.25,
                  size = 0.5) +
    ggtitle(title) +
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab(expression(Density~(m^{2})))

  ifelse(isTRUE(print_dataframe), print(list(a,p)), print(p))
}


plot_stratum_den_by_year <- function(project = "NCRMP", region, species_filter = "NULL", title, print_dataframe = "NULL") {

  tmp <-  NCRMP_DRM_calculate_colony_density(project, region, species_filter = "NULL")

  a <- tmp$density_strata

  p <- ggplot(a, aes(x=as.factor(YEAR), y=avden, color = STRAT, group = STRAT)) +
    geom_line(size=1) + geom_point(size=3) +
    geom_errorbar(aes(ymin = avden - SE, ymax = avden + SE),
                  width = 0.25,
                  size = 0.5) +
    ggtitle(title) +
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab(expression(Density~(m^{2})))

  ifelse(isTRUE(print_dataframe), print(list(a,p)), print(p))
}


plot_domain_cvr_by_year <- function(region, title, cover_category, print_dataframe = "NULL") {

  tmp <-  NCRMP_calculate_cover(region)

  a <- tmp$Domain_est %>%
    dplyr::filter(cover_group == cover_category)

  p <- ggplot(a, aes(x=as.factor(YEAR), y=avCvr, group = 1)) +
    geom_line(size=1) + geom_point(size=3) +
    geom_errorbar(aes(ymin = avCvr - SE, ymax = avCvr + SE),
                  width = 0.25,
                  size = 0.5) +
    ggtitle(title) +
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab("Coral cover (%)")

  ifelse(isTRUE(print_dataframe), print(list(a,p)), print(p))
}








