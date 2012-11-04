package org.springframework.samples.petclinic;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public aspect Chrono {

    private static final Logger LOG = LoggerFactory.getLogger(Chrono.class);

    Object around() : execution(public * org.springframework.samples.petclinic..*(..)) {
        long start = System.currentTimeMillis();
        try {
            return proceed();
        } finally {
            String prefix = "";
            Object method = thisJoinPointStaticPart.getSignature();
            long end = System.currentTimeMillis();
            long duration = end - start;
            if(duration > 50)
                prefix = "SLOW METHOD";
            if(duration > 500)
                prefix = "VERY SLOW METHOD";
            if(duration > 1000)
                prefix = "ULTRA SLOW METHOD";
            if(!prefix.isEmpty())
                LOG.info(prefix+" "+method+" "+duration+" ms");
        }
    }
}