module.exports = function(){
    var express = require('express');
    var router = express.Router();


    function getRatingEntries(res, mysql, context, complete, id){
        var sql = "SELECT score, explanation From Rating_Entry Inner Join Movie on Rating_Entry.movie_id = ? WHERE Movie.movie_id = ?";
        var inserts = [id, id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }

            context.rating_entry = results;
            complete();
        });
    }


    function getMovie(res, mysql, context, complete, id){
        var sql = "SELECT movie_duration,release_date,language,country,user_watched From Movie WHERE movie_id = ?"; 
        // var sql = "SELECT director, producer, gross, totalAudiScore, totalCriticScore From Movie WHERE movie_id = ?";
        var inserts = [id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
        if(error){
            res.write(JSON.stringify(error));
            res.end();
        }

            context.movie = results[0];
            complete();
        });
    }

    function getTitle(res, mysql, context, complete, id){
        var sql = "SELECT movie_title From Movie WHERE movie_id = ?";
        var inserts = [id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
        if(error){
            res.write(JSON.stringify(error));
            res.end();
        }

            context.movie_title = results[0];
            complete();
        });
    }

    function getCast(res, mysql, context, complete, id){
        var sql = "SELECT actorName From Cast WHERE movie_id = ?";
        var inserts = [id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
        if(error){
            res.write(JSON.stringify(error));
            res.end();
        }

            context.cast = results;
            console.log("results: ", results[0]);
            complete();
        });
    }

    router.get('/:id', function(req, res){
        var context = {};
        var callbackCount = 0;
        var mysql = req.app.get('mysql');

        getTitle(res, mysql, context, complete, req.params.id);
        getCast(res, mysql, context, complete, req.params.id);
        getMovie(res, mysql, context, complete, req.params.id);
        getRatingEntries(res, mysql, context, complete, req.params.id);
        function complete(){
            callbackCount++;
            if(callbackCount >= 4){
                console.log("context: ", context);
                res.render('singleMovie', context);
            }

        }

    });

    return router;
}();
