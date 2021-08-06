fa_table <- function(x, cut) {
  #get sorted loadings
  loadings <- psych::fa.sort(x)$loadings %>% round(3)
  #supress loadings
  loadings[loadings < cut] <- ""
  # get variances
  varinfo <-as.data.frame(x$Vaccounted[1:2,]) %>% round(3)
  item <-row.names(varinfo)
  varinfo <-cbind(item,varinfo) %>% mutate_if(is.numeric,as.character)
  rownames(varinfo) <- c(1:2)
  #get additional info
  add_info <- cbind(x$communalities, 
                    x$uniquenesses) %>%
    # make it a data frame
    as.data.frame() %>%
    # column names
    rename("Communality" = V1,
           "Uniqueness" = V2) %>%
    #get the item names from the vector
    tibble::rownames_to_column("item")
  #  as.character(ggformula::get_variable_labels("item"))
  #build table
  loadings %>%
    unclass() %>%
    as.data.frame() %>%
    #as.character(ggformula::get_variable_labels("item"))  %>%   
    tibble::rownames_to_column("item") %>%
    left_join(add_info) %>%
    bind_rows(varinfo) %>%
    mutate(across(where(is.numeric), round, 3)) %>%
    replace(is.na(.), "-")  
}