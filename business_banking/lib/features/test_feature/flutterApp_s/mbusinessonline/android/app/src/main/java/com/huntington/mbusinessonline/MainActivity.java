package com.huntington.mbusinessonline;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.view.ViewTreeObserver;
import android.view.WindowManager;

public class MainActivity extends FlutterFragmentActivity {


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {

        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
