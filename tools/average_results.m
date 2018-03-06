function result = average_results(data)

N = length(data);
K = length(data{1}.total_time);

total_time                     = zeros(1, K);
solver_time                    = zeros(1, K);
collision_detection_time       = zeros(1, K);
preprocessing_time             = zeros(1, K);
narrow_time                    = zeros(1, K);
broad_time                     = zeros(1, K);
contact_reduction_time         = zeros(1, K);
contacts                       = zeros(1, K);
minimum_penetration            = zeros(1, K);
maximum_penetration            = zeros(1, K);
average_penetration            = zeros(1, K);
kdop_work_pool_time            = zeros(1, K);
kdop_traversal_time            = zeros(1, K);
kdop_traversal_launches        = zeros(1, K);
kdop_traversal_gpu_setup_time  = zeros(1, K);
kdop_traversal_gpu_read_time   = zeros(1, K);
kdop_traversal_gpu_write_time  = zeros(1, K);    
kdop_updating_time             = zeros(1, K);
kdop_refit_time                = zeros(1, K);
kdop_refit_launches            = zeros(1, K);
kdop_refit_gpu_setup_time      = zeros(1, K);
kdop_refit_gpu_cleanup_time    = zeros(1, K);
kdop_refit_gpu_read_time       = zeros(1, K);
kdop_refit_gpu_write_time      = zeros(1, K);    
transform_time                 = zeros(1, K);
transform_launches             = zeros(1, K);
transform_gpu_read_time        = zeros(1, K);
transform_gpu_write_time       = zeros(1, K);    
contact_launches               = zeros(1, K);
contact_time                   = zeros(1, K);
contact_gpu_read_time          = zeros(1, K);
contact_gpu_write_time         = zeros(1, K);
contact_gpu_postprocess        = zeros(1, K);

for i=1:N        
    total_time                     = total_time                    + data{i}.total_time;
    solver_time                    = solver_time                   + data{i}.solver_time;
    collision_detection_time       = collision_detection_time      + data{i}.collision_detection_time;
    preprocessing_time             = preprocessing_time            + data{i}.preprocessing_time;
    narrow_time                    = narrow_time                   + data{i}.narrow_time;
    broad_time                     = broad_time                    + data{i}.broad_time;
    contact_reduction_time         = contact_reduction_time        + data{i}.contact_reduction_time;
    contacts                       = contacts                      + data{i}.contacts;
    minimum_penetration            = minimum_penetration           + data{i}.minimum_penetration;
    maximum_penetration            = maximum_penetration           + data{i}.maximum_penetration;
    average_penetration            = average_penetration           + data{i}.average_penetration;
    kdop_work_pool_time            = kdop_work_pool_time           + data{i}.kdop_work_pool_time;
    kdop_traversal_time            = kdop_traversal_time           + data{i}.kdop_traversal_time;
    kdop_traversal_launches        = kdop_traversal_launches       + data{i}.kdop_traversal_launches;
    kdop_traversal_gpu_setup_time  = kdop_traversal_gpu_setup_time + data{i}.kdop_traversal_gpu_setup_time;
    kdop_traversal_gpu_read_time   = kdop_traversal_gpu_read_time  + data{i}.kdop_traversal_gpu_read_time;
    kdop_traversal_gpu_write_time  = kdop_traversal_gpu_write_time + data{i}.kdop_traversal_gpu_write_time;
    kdop_updating_time             = kdop_updating_time            + data{i}.kdop_updating_time;
    kdop_refit_time                = kdop_refit_time               + data{i}.kdop_refit_time;
    kdop_refit_launches            = kdop_refit_launches           + data{i}.kdop_refit_launches;
    kdop_refit_gpu_setup_time      = kdop_refit_gpu_setup_time     + data{i}.kdop_refit_gpu_setup_time;
    kdop_refit_gpu_cleanup_time    = kdop_refit_gpu_cleanup_time   + data{i}.kdop_refit_gpu_cleanup_time;
    kdop_refit_gpu_read_time       = kdop_refit_gpu_read_time      + data{i}.kdop_refit_gpu_read_time;
    kdop_refit_gpu_write_time      = kdop_refit_gpu_write_time     + data{i}.kdop_refit_gpu_write_time;
    transform_time                 = transform_time                + data{i}.transform_time;
    transform_launches             = transform_launches            + data{i}.transform_launches;
    transform_gpu_read_time        = transform_gpu_read_time       + data{i}.transform_gpu_read_time;
    transform_gpu_write_time       = transform_gpu_write_time      + data{i}.transform_gpu_write_time;
    contact_launches               = contact_launches              + data{i}.contact_launches;
    contact_time                   = contact_time                  + data{i}.contact_time;
    contact_gpu_read_time          = contact_gpu_read_time         + data{i}.contact_gpu_read_time;
    contact_gpu_write_time         = contact_gpu_write_time        + data{i}.contact_gpu_write_time;    
    contact_gpu_postprocess        = contact_gpu_postprocess       + data{i}.contact_gpu_postprocess;    
    
end

total_time                     = total_time./ N;
solver_time                    = solver_time./ N;
collision_detection_time       = collision_detection_time./ N;
preprocessing_time             = preprocessing_time./ N;
narrow_time                    = narrow_time./ N;
broad_time                     = broad_time./ N;
contact_reduction_time         = contact_reduction_time./ N;
contacts                       = contacts./ N;
minimum_penetration            = minimum_penetration./ N;
maximum_penetration            = maximum_penetration./ N;
average_penetration            = average_penetration./ N;
kdop_work_pool_time            = kdop_work_pool_time./ N;
kdop_traversal_time            = kdop_traversal_time./ N;
kdop_traversal_launches        = kdop_traversal_launches./ N;
kdop_traversal_gpu_setup_time  = kdop_traversal_gpu_setup_time./ N;
kdop_traversal_gpu_read_time   = kdop_traversal_gpu_read_time./ N;
kdop_traversal_gpu_write_time  = kdop_traversal_gpu_write_time./ N;
kdop_updating_time             = kdop_updating_time./ N;
kdop_refit_time                = kdop_refit_time./ N;
kdop_refit_launches            = kdop_refit_launches./ N;
kdop_refit_gpu_setup_time      = kdop_refit_gpu_setup_time./ N;
kdop_refit_gpu_cleanup_time    = kdop_refit_gpu_cleanup_time./ N;
kdop_refit_gpu_read_time       = kdop_refit_gpu_read_time./ N;
kdop_refit_gpu_write_time      = kdop_refit_gpu_write_time./ N;
transform_time                 = transform_time./ N;
transform_launches             = transform_launches./ N;
transform_gpu_read_time        = transform_gpu_read_time./ N;
transform_gpu_write_time       = transform_gpu_write_time./ N;
contact_launches               = contact_launches./ N;
contact_time                   = contact_time./ N;
contact_gpu_read_time          = contact_gpu_read_time./ N;
contact_gpu_write_time         = contact_gpu_write_time./ N;
contact_gpu_postprocess        = contact_gpu_postprocess./ N;

result = struct(...
    'total_time'                     , total_time,...
    'solver_time'                    , solver_time,...
    'collision_detection_time'       , collision_detection_time,...
    'preprocessing_time'             , preprocessing_time,...
    'narrow_time'                    , narrow_time,...
    'broad_time'                     , broad_time,...
    'contact_reduction_time'         , contact_reduction_time,...
    'contacts'                       , contacts,...
    'minimum_penetration'            , minimum_penetration,...
    'maximum_penetration'            , maximum_penetration,...
    'average_penetration'            , average_penetration,...
    'kdop_work_pool_time'            , kdop_work_pool_time,...
    'kdop_traversal_time'            , kdop_traversal_time,...
    'kdop_traversal_launches'        , kdop_traversal_launches,...
    'kdop_traversal_gpu_setup_time'  , kdop_traversal_gpu_setup_time,...
    'kdop_traversal_gpu_read_time'   , kdop_traversal_gpu_read_time,...
    'kdop_traversal_gpu_write_time'  , kdop_traversal_gpu_write_time,...
    'kdop_updating_time'             , kdop_updating_time,...
    'kdop_refit_time'                , kdop_refit_time,...
    'kdop_refit_launches'            , kdop_refit_launches,...
    'kdop_refit_gpu_setup_time'      , kdop_refit_gpu_setup_time,...
    'kdop_refit_gpu_cleanup_time'    , kdop_refit_gpu_cleanup_time,...
    'kdop_refit_gpu_read_time'       , kdop_refit_gpu_read_time,...
    'kdop_refit_gpu_write_time'      , kdop_refit_gpu_write_time,...
    'transform_time'                 , transform_time,...
    'transform_launches'             , transform_launches,...
    'transform_gpu_read_time'        , transform_gpu_read_time,...
    'transform_gpu_write_time'       , transform_gpu_write_time,...
    'contact_launches'               , contact_launches,...
    'contact_time'                   , contact_time,...
    'contact_gpu_read_time'          , contact_gpu_read_time,...
    'contact_gpu_write_time'         , contact_gpu_write_time,...    
    'contact_gpu_postprocess'        , contact_gpu_postprocess...
    );
end
