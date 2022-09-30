plot_domain_den_by_year_by_prot <- function(dataset, species, title = NULL) {
  
  a <-  getDomainDensity(dataset, species, merge_protected = F) %>%
    filter(!protected_status == "all") %>%
    mutate( SE   = sqrt(var),
            YEAR = as_factor(YEAR),
            protected_status = as_factor(protected_status))
  
  yupper = max(a$density + a$SE)
  
  ggplot(a, aes(x=YEAR, y=density, color = protected_status, group = protected_status)) + 
    geom_line(size=1) + geom_point(size=3) + 
    geom_errorbar(aes(ymin = density - SE, ymax = density + SE),
                  width = 0.25,
                  size = 0.5) + 
    ggtitle(title) + 
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab("Density")
  
}

plot_domain_den_by_year <- function(dataset, species, present = FALSE, title = NULL, print_datafreame = NULL) {
  
  a <-  getDomainDensity(dataset, species, when_present = present) %>%
    mutate( SE   = sqrt(var),
            YEAR = as_factor(YEAR))
  
  yupper = max(a$density + a$SE)
  
  p <- ggplot(a, aes(x=YEAR, y=density, group = 1)) + 
    geom_line(size=1) + geom_point(size=3) + 
    geom_errorbar(aes(ymin = density - SE, ymax = density + SE),
                  width = 0.25,
                  size = 0.5) + 
    ggtitle(title) + 
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab("Density")
  
  print(list(a, p))
  
}

plot_strat_den_by_year <- function(dataset, species, title = NULL) {
  
  a <- getStratumDensity(dataset, species) %>%
    mutate(SE = sqrt(var),
           YEAR = as_factor(YEAR),
           PROT = as_factor(PROT)) %>%
    replace(is.na(.), 0)
  
  yupper = max(a$density + a$SE)
  
  # ggplot(filter(a, !STRAT %in% c("BDRKDEEP", "BDRKSHLW", "SCRDEEP", "SCRSHLW")), aes(x=YEAR, y=density)) +
  ggplot(a, aes(x=YEAR, y=density, color = PROT, group = PROT)) +
    geom_line(size=1) + geom_point(size=3) +
    geom_errorbar(aes(ymin = density - SE, ymax = density + SE),
                  width = 0.25,
                  size = 0.5) + 
    facet_wrap(~STRAT) +
    ggtitle(title) + 
    theme_Publication(base_size = 20) +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
    xlab("Year") + ylab("Density")
}

plot_domain_occ_by_year <- function(dataset, species, title = NULL) {
  
  a <- getDomainOccurrence(dataset, species,) %>%
    mutate(SE = sqrt(var),
           YEAR = as_factor(YEAR))
  
  yupper = max(a$occurrence + a$SE)
  
  ggplot(a, aes(x=YEAR, y=occurrence, group = 1)) + 
    geom_line(size=1) + geom_point(size=3) + 
    geom_errorbar(aes(ymin = occurrence - SE, ymax = occurrence + SE),
                  width = 0.25,
                  size = 0.5) + 
    ggtitle(title) + 
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab("Occurrence")
}

plot_domain_occ_by_year_by_prot <- function(dataset, species, title = NULL) {
  
  a <-  getDomainOccurrence(dataset, species, merge_protected = F) %>%
    filter(!protected_status == "all") %>%
    mutate( SE   = sqrt(var),
            YEAR = as_factor(YEAR),
            protected_status = as_factor(protected_status))
  
  yupper = max(a$occurrence + a$SE)
  
  ggplot(a, aes(x=YEAR, y=occurrence, color = protected_status, group = protected_status)) + 
    geom_line(size=1) + geom_point(size=3) + 
    geom_errorbar(aes(ymin = occurrence - SE, ymax = occurrence + SE),
                  width = 0.25,
                  size = 0.5) + 
    ggtitle(title) + 
    theme_Publication(base_size = 20) +
    xlab("Year") + ylab("Occurrence")
}

plot_domain_LF_by_year <- function(data, species, bin_size, yrs = NULL, vertical_line = NULL, title = NULL) {
  
  a <- lenFreq_MultiYear_by_spp(df = data, spp = species, bin_size = bin_size, yrs = yrs, spp_name = species)
  
  plot_bins(x = a, ttle = title, bin_size = bin_size,vline_at_lc = vertical_line)
  
  
}




