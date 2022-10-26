use parcialii;

-- Selection one table at time
select * from movies;
select * from movies where (year > 2000);
select * from languages;
select * from credits;
select * from genres;
select * from certificates;
select * from locations;
select * from people;

-- Selection multpiple tables
select * from credits where (group_order = 1 and subgroup_order = 2)
	order by position;
    
select movies.id, movies.title, languages.language from movies
	left outer join languages
		ON language = "English" or language = "German"
        where movies.id = languages.movie_id;
    
select movies.id, movies.title, credits.person_id, credits.type from movies
	left outer join credits
		on movies.id = 49
where movies.id = 49;


-- other consults
select movies.title, certificates.certificate from movies, certificates, languages
	where movies.id = languages.movie_id and languages.language = "English";
    
select movies.id, movies.title, genres.genre, locations.location from movies, genres, locations
	where (movies.id = genres.movie_id and genres.genre LIKE '%Drama%');


select people.name, people.gender, credits.type, locations.location from people, credits, locations
	where (credits.type = "director" and people.gender = "Female")
    and (locations.location = "Colombia" or locations.location = "China"
		or locations.location = "Portugal" or locations.location = "Serbia");
        
