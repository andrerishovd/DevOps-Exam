package com.aialpha.sentiment.metrics;

import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Counter;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.stereotype.Component;

@Component
public class SentimentMetrics {

    private final MeterRegistry meterRegistry;
    private final AtomicInteger companiesGauge = new AtomicInteger(0);

    // Constructor injection of MeterRegistry
    public SentimentMetrics(MeterRegistry meterRegistry) {
        this.meterRegistry = meterRegistry;

        meterRegistry.gauge("sentiment.companies.detected", companiesGauge);
    }

    /**
     * Example implementation: Counter for sentiment analysis requests
     * This counter tracks the total number of sentiment analyses by sentiment type and company
     */
    public void recordAnalysis(String sentiment, String company) {
        Counter.builder("sentiment.analysis.total")
                .tag("sentiment", sentiment)
                .tag("company", company)
                .description("Total number of sentiment analysis requests")
                .register(meterRegistry)
                .increment();
    }

    public void recordDuration(long milliseconds, String company, String model) {
        Timer.builder("sentiment.analysis.duration")
                .tag("company", company)
                .tag("model", model)
                .description("Duration of an analysis for a company")
                .register(meterRegistry)
                .record(milliseconds, TimeUnit.MILLISECONDS);
    }

    public void recordCompaniesDetected(int count) {
        companiesGauge.set(count);
    }

    public void recordConfidence(double confidence, String sentiment, String company) {
        // TODO: Record distribution summary
    }
}
