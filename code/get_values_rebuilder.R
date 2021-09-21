get_values <- function(rebuild_dir, num_rows = 200) {

	res <-  readLines(file.path(rebuild_dir, "RES.CSV"))

	start <- grep("#Summary_2", res) + 1
	end   <- grep("#Summary_3", res) + 1 
	temp  <- noquote(strsplit(res[start:(start + 15)],","))
	summary_2 <- matrix(NA, 16, 9) ; summary_3 <- matrix(NA, 8, 10)
	summary_2 <- mapply(function(x) summary_2[x,] = noquote(as.numeric(temp[[x]])), x = 1:16)
	summary_2 <- t(summary_2)
	temp  <- noquote(strsplit(res[end:(end + 7)], ","))
	summary_3 <- mapply(function(x) summary_3[x,] = as.numeric(temp[[x]]), x = 1:8)
	summary_3 <- t(summary_3)
	start <- grep("#Recovery_Spec", res) + 1
	end   <- start + 9
	recovery_spec <- unlist(noquote(strsplit(res[start:end],",")))
	recovery_spec <- as.numeric(recovery_spec)
	find <- grep("#Biol_Pars", res) - 4
	mean_gen <- as.numeric(unlist(noquote(res[find])))

	#Read in the catches from the rebuilder RES.CSV file
	start = grep("#Summary_1", res) + 3
    end = grep("#Summary_1", res) + num_rows + 2 
    temp  <- noquote(strsplit(res[start:end],","))
    find = 2:11

    tmax <- recovery_spec[10]
	tmin <- recovery_spec[1] #ceiling(summary_2[6,7])
	spr_rebuild_vec  <- summary_2[2,1:9]
	prebuild_vec <- summary_2[4,1:9]/100
	ttarget_vec <- ceiling(summary_2[6,1:9]) + recovery_spec[3]
	rebuild_quants <- data.frame(Ttarget = ttarget_vec,
								 SPR = spr_rebuild_vec,
								 Prebuild = prebuild_vec)
	tmid <- rebuild_quants[6,1]
	row_names <- c(noquote(strsplit(res[start-1],","))[[1]][find[-1]])
	rownames(rebuild_quants) = row_names

   	prob_matrix = NULL
    for(yy in find){
    	grab = mapply(function(x) grab = noquote(as.numeric(temp[[x]][yy])), x = 1:num_rows)
    	prob_matrix = cbind(prob_matrix, grab)
    }
   	col_names = c("Year", noquote(strsplit(res[start-1],","))[[1]][find[-1]])
   	colnames(prob_matrix) = col_names

   	acl_matrix = NULL
    find = 12:21
    for(yy in find){
    	grab = mapply(function(x) grab = noquote(as.numeric(temp[[x]][yy])), x = 1:num_rows)
    	acl_matrix = cbind(acl_matrix, grab)
    }
   	col_names = c("Year", noquote(strsplit(res[start-1],","))[[1]][find[-1]])
   	colnames(acl_matrix) = col_names

   	relativeb_matrix = NULL
    find = 22:31
    for(yy in find){
    	grab = mapply(function(x) grab = noquote(as.numeric(temp[[x]][yy])), x = 1:num_rows)
    	relativeb_matrix = cbind(relativeb_matrix, grab)
    }
   	col_names = c("Year", noquote(strsplit(res[start-1],","))[[1]][find[-1]])
   	colnames(relativeb_matrix) = col_names

   	ssb_matrix = NULL
    find = 32:41
    for(yy in find){
    	grab = mapply(function(x) grab = noquote(as.numeric(temp[[x]][yy])), x = 1:num_rows)
    	ssb_matrix = cbind(ssb_matrix, grab)
    }
   	col_names = c("Year", noquote(strsplit(res[start-1],","))[[1]][find[-1]])
   	colnames(ssb_matrix) = col_names

   	ofl_matrix = NULL
    find = 42:51
    for(yy in find){
    	grab = mapply(function(x) grab = noquote(as.numeric(temp[[x]][yy])), x = 1:num_rows)
    	ofl_matrix = cbind(ofl_matrix, grab)
    }
   	col_names = c("Year", noquote(strsplit(res[start-1],","))[[1]][find[-1]])
   	colnames(ofl_matrix) = col_names

   	spr_matrix = NULL
    find = 52:61
    for(yy in find){
    	grab = mapply(function(x) grab = noquote(as.numeric(temp[[x]][yy])), x = 1:num_rows)
    	spr_matrix = cbind(spr_matrix, grab)
    }
   	col_names = c("Year", noquote(strsplit(res[start-1],","))[[1]][find[-1]])
   	colnames(spr_matrix) = col_names

   	start <- grep("#B0_Etc", res) + 1
	end   <- start + 7
	b0_etc <- unlist(noquote(strsplit(res[start:end],",")))
	b0_etc <- as.numeric(b0_etc)
	sb0  <- b0_etc[1]
	sb40 <- b0_etc[2]
	sb_ass_year <- b0_etc[3]
	sb_decl_year <- b0_etc[4]
	prob_depl <- b0_etc[5]
	prob_overfished <- b0_etc[6]
	alpha <- b0_etc[7]
	beta  <- b0_etc[8]

	out <- list()
	out$acl_matrix <- acl_matrix
	out$ofl_matrix <- ofl_matrix
	out$prob_matrix <- prob_matrix
	out$ssb_matrix <- ssb_matrix
	out$spr_matrix <- spr_matrix
	out$relativeb_matrix <- relativeb_matrix
	out$recovery_spec <- recovery_spec
	out$summary_2 <- summary_2
	out$summary_3 <- summary_3
	out$rebuild_quants <- rebuild_quants
	out$tmax	<- tmax
	out$tmin	<- tmin
	out$tmid    <- tmid
	out$mean_gen <- mean_gen
	out$sb0 <- sb0
	out$sb40 <- sb40
	out$sb_ass_year <- sb_ass_year
	out$sb_decl_year <- sb_decl_year
	out$prob_depl	<- prob_depl
	out$prob_overfished <- prob_overfished
	out$alpha <- alpha
	out$beta <- beta
	out$loc <- rebuild_dir
	return(out)
}