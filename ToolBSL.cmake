include_guard(GLOBAL)

# store BUILD_SHARED_LIBS in a local value & unset it
function(bsl_store)
    if (DEFINED BUILD_SHARED_LIBS)
        set(BSL_LOCAL "${BUILD_SHARED_LIBS}")
        unset(BUILD_SHARED_LIBS CACHE)
        message(STATUS "[bsl_store] stored 'BUILD_SHARED_LIBS' locally and unset it.")
    else()
        message(STATUS "[bsl_store] 'BUILD_SHARED_LIBS' isn't defined.")
    endif()
endfunction()

# ignore BUILD_SHARED_LIBS by removing it
function(bsl_ignore)
    if (DEFINED BUILD_SHARED_LIBS)
        unset(BUILD_SHARED_LIBS CACHE)
        message("STATUS" "[bsl_ignore] 'BUILD_SHARED_LIBS' has been ignored.")
    endif()
endfunction()

# restore BUILD_SHARED_LIBS from a local value
function(bsl_restore)
    if (DEFINED BSL_LOCAL)
        set(BUILD_SHARED_LIBS "${BSL_LOCAL}" CACHE BOOL "[bsl_restore] restore BUILD_SHARED_LIBS from a local value" FORCE)
        message("[bsl_restore] restore BUILD_SHARED_LIBS from a local value.")
    else()
        message("[bsl_restore] can't restore value cause 'BSL_LOCAL' isn't set.")
    endif()
endfunction()

function(bsl_set value)
    if(value STREQUAL "ON" AND value STREQUAL "OFF")
        set(BUILD_SHARED_LIBS ${value} CACHE BOOL "build_shared_libs on/off" FORCE)
    else()
        message(FATAL_ERROR "[bsl_set] Invalid value: ${value}. Must be ON or OFF.")
    endif()
endfunction()
