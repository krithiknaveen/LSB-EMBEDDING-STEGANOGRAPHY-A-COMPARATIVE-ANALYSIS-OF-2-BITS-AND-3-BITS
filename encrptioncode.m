x = zeros(1,262144);
x(1) = 0.462;

for i = 2:numel(x)
    x(i) = x(i-1)*(7.828/(2*pi))*sin(2*pi*x(i-1))+sin(3.8135*x(i-1)*(1-x(i-1)));
end

min_position = 1;  
max_position = numel(masked_image1_2);  
x_normalized = round((x-min(x))/(max(x)-min(x))*(max_position-min_position)+min_position);

disp('The total number of pixels in the masked image : ')
disp(max_position);

message_string = 'I am from SASTRA University.';
message_binary = dec2bin(message_string, 8); 
message_binary_flat = reshape(message_binary.', 1, []);
num_bits_to_store = numel(message_binary_flat);
disp('Number of bits : ');
disp(num_bits_to_store);

for i = 1:2:num_bits_to_store
    if i+1 <= num_bits_to_store
        masked_image1_2(x_normalized((i+1)/2)) = bitset(masked_image1_2(x_normalized((i+1)/2)), 7, message_binary_flat(i) == '1');
        masked_image1_2(x_normalized((i+1)/2)) = bitset(masked_image1_2(x_normalized((i+1)/2)), 8, message_binary_flat(i+1) == '1');
    else
        masked_image1_2(x_normalized((i+1)/2)) = bitset(masked_image1_2(x_normalized((i+1)/2)), 7, message_binary_flat(i) == '1');
    end
end

imwrite(masked_image1_2, 'message.png');